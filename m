Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A02A5476E6
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988708; cv=pass; b=q7HmiZT7FSRovEH5cBgfiHnkkxTXlKywBN15A5c2evtq4XlLiPWK6WQmftGg1yMDJz+ml2Ya5s8ZghacoS5jBtuHnR4AfYjbMTWRmV7MDqaX9J8EYss2VaP6FVX9ATsv+14mocWheRJdIEC+EkgUjri7RhfrpIz1znB3HjbvP90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988708; c=relaxed/simple;
	bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLiqn7fiCV028xCS36qWImGRmqKGHD8E8ul0XT/YwhFwK/eIjHIbQKoitTIwAAsxxgLGYPA7CR2cWlafLufoJBAP5vrpICWnVUcy1eunHeCFwMXkLKYNiU4b6Me7mJa7auAUZe5r//n3PN0eTYSWOPjuAVWvjrpELwwi2igbb4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cngxshHk; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cngxshHk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso1443142a12.1
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 07:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791988705; cv=none;
        d=google.com; s=arc-20260327;
        b=DN4Sv7ZmTtvgt4CnaE9pE3NWM46/kt5VNwNSj9zAnT4FPuSE/SW8Ml7+ZTuoGT46DV
         lSy9y89Zg+yPegAcmWfrtBuFq34H00tizTO2njotq1Q/iLDiLWEHeEtSVQ87aKE3B3iS
         T8fYFJykVlYoqDxJ/+LX/TovWFp2SmRfNWLwQHyDvz2ZGx+6wGive36fBG5zf68bhvEj
         KOHvW7Yeb+dZZJDm9y4Oo4NVGX/yJvexsN+YCpeEYLzIgEBChbfXsbbc+1ydOSWMHv/U
         udM8xgUZgJaa0cuuSt2HtCtE+pE43HCZkgU+1i6D5GebezVLHIwq1EjJLxNtd8e/48gG
         Iyng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        fh=zBLpyE1shmwoTwuupNd19ThFhgbsyyc7RRfRje6+XGE=;
        b=JW/uedZeaUIEWj4ozZwwXum4GNBu0sQe5sQxyr67Id2XVRIpoKEcxgWLfhswxz6LDw
         rBn8sPLxWklid1+HJVl/oAWQS39zfOvw47t+CYRAnWjx466t1e5V8Mlaub/dhCzP98mI
         0K1uUltGDwhWQQBLEZ41aYruhfXacoSKtPs1aG6MbVCtPSeuvdNpShCZ1abXipffyFr/
         71pP84TZwM75UP8dEabJGL5OFsR9UR3jpTP2mOfdRxs3i93qmw0G9k0kb5b7LyHIN9QW
         XEsRccC3y3Xaubd6cy0LOQ0/u7/reiX1ofpZW/CLNvkqKaT6LZ/peZ8l9Sx7nDFFtOH1
         6FsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791988705; x=1792593505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=cngxshHkw8vpezJT+yDObXyASEd/+1ZURQ3kSvVkslJTVzG3tDddeyu6Itpilt2JMA
         ec1WM/YYgS3Rq+vyX4T4IeWYoQ6OxvUiPFQKj/JmDAP4bVMSF7iOJ9EhmAZeTB6IBdyW
         hrr5fD+726lY+ajAr5CUAAonz79E10XEa2mHWfe7oiuU+5I4HQVr9qTl+RLPz1Diqx29
         GtSbTklK5jEE1PNTzOz4Evx6U/DUQ6OIJjmi6onPw4b4rseZ8zc4j/e6G/SDgBZfMjcD
         q01QWWumP4wG0aQUh+R5aOlmSu3VVONxsq4Rn1Mj6JpmuA+W5oTi/cpSHA+wcMS+164o
         h7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988705; x=1792593505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=A199/Cck6VfsGpEaTlj6L277YlBfAZS00kkcSLpGaCVRZjHITWEbE+FKctYI9cF8eP
         Au9je5Bh7+M7ycBcE+XEBnNMWs5xWOKnZHGLCEp8cEdWRlf3ln7Y8PLvzHaFn+m17F9b
         xk6bxxid45dLFoyiYgx4kCtV07ZBN1xKT1dWRsLkckiu3hpWZou/gz9ofrTCOb1kFlgY
         1kUtWFpc6u1inR6J3K4C77klB4cWh9Jd5ZTzKfNkUNCeZHObtkG9ur85CpF9exJNqB3A
         PZXnDmD0LOSWXT1zBxUWOfDu7tEhe1FM43jitG44z8XpRoVLyIr/gJq9LPjTzOqTIwoQ
         mgRw==
X-Forwarded-Encrypted: i=1; AKwUvBxhY2qLx2RF+qvBlzo8BeQVS+6NF7KHy5XDWf8I/H4Fy94L/Muu+6aQRd7JihSaW2fK9DFnF5IFJpEdaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyfrNC3fD6VuI8xykh4zxpOLVnt5OE4Q0Ht/G2GSLkzc73ccMB
	4N0q0n5A4JLVDF2vXpGpix8DmhV+NxWXuYB5xXTc690DFS9P0eSYrrDgd7q+Ad6FkA4CfCwvMFJ
	MuR8hlcXUx1zH1bkcdh1i3ggLS2x7ow==
X-Gm-Gg: AYBFou04YjTLf0cplwFqs83kMaxwpWqpxsR16g/A3Zx0OUFmcFQZFJAxGd3zROVSQyd
	pXSKnGd94SMDFuXj2Gc0AREZ1SVTNAecLwSC+zcpKs3ZhqdqKN7Vw8kDeLQmJaC5dQstzbUzS36
	71fS25s9S2KsbedwywKBGVySLIM2M9H9ok+QsG066o4aRKRA7CBfMYGxSvcYC50ZGS33OIaxGin
	3GZcB2shV+Dl2dxz6tYFVVjK9VWzoF7PKupGShjEPhjAIZbhN2UB+WvwPdVN8KSaDa8pxkYX8S2
	844VGdnBUStTaUUxQas7DRNTZn0dqYxa/zFbJYhcnsXXq1GjMxQlJDhq+AjyQoULWwxPw69I5rk
	OvT7XOL2U0cZq2nB3OXxKvdOXO82pw/o8ayzqCXY=
X-Received: by 2002:a05:6402:1912:b0:6ac:b9b5:8e8b with SMTP id
 4fb4d7f45d1cf-6b17c2a3670mr12616709a12.15.1791988704432; Wed, 14 Oct 2026
 07:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791975048.git.asml.silence@gmail.com>
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Wed, 14 Oct 2026 20:07:46 +0530
X-Gm-Features: AclHuK8DZ9QwF2AgJ3SDr4lT4xl3Cf9evBnlWqjNFK8bj0mT2h6JXCYZXSbhb_A
Message-ID: <CACzX3Ases=5auovox0XFNheDHY9iNmxv2BvB0dugC-W3mnjGLw@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] Add dmabuf read/write via io_uring
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	William Power <william.power@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Tushar, William, Phil did a lot of testing and experimentation on various
> devices with previous versions of the patch set, and I've received lots
> of help from Anuj, Kanchan and Nitesh with investigations, testing, and
> patching. Earlier benchmarks by Anuj for IOMMU optimisations with udmabuf
> showed:
>
> STRICT: before = 570 KIOPS, after = 5.01 MIOPS
> LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
> PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS

I've been involved in the development of this series, so I won't add a
Reviewed-by tag, but I tested it on NVMe with both an AMD GPU dma-buf
and udmabuf exporter, using the liburing tests and custom fio plumbing.

Feel free to add:
Tested-by: Anuj Gupta <anuj20.g@samsung.com>
