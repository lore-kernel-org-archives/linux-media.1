Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678035172C2
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 20:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922165; cv=none; b=NpoiTkr6EH58utxfLk3w33Rz/Sy78ccfnMBfQxaC4uyR53KV7a93jT+6f9XD8yLePvaT0kgQw5Av4+EkNrj/A70j0YTlR7Ho8EZqIE5v2RzfHkpx+iAgiAJ0ensF7Mb5xuG26TjzGFuyo6nLuZsLFaWswfdrq4hH9bUYYK3EWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922165; c=relaxed/simple;
	bh=NrenYkyGWgfz/6r9jzkmCjYiJ49/s0j3/93r31ckaP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3lxKAFho/uzpc/FZGPJhvme1Za9tN2I6Nr2CaBf06vvM00PZ8ts4mHemHuzgkvxeJ0fpnCGmBBwZHGiAOsye8877BTtiEFkpk2GOGd0FLg30r47KY0YcwKESCuYwJMyQzJUCmHvlipHZqalMti7wCIH+p9TSVcSeUX6Y8otrkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnXe7AuC; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnXe7AuC"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c02782159so2086869f8f.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922161; x=1792526961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0gpLt7+oS9KQUHShMJeHfOIQi0PPRoxYfM2szDl9BQ=;
        b=LnXe7AuCdnyYnpb6vaGdKk9dNPmYvfuTLMnncmlSHO3bm6LdV5oOFFQ/Hul0fKBMet
         W4nAlbEzoX6HWs6HnCfIDeznmSQmwClyMr+jPICKPEmfXXfo1VXB4SThaFthNtvRHz2l
         HHSAdyzffbMi5JM4yQNKCGSJ756lqg0vmqcnbXSXqkoyzk6PX1CcwWQ8nWsxyFJjO7kh
         zbyj/rZBdtDTsaj8uvPhVRtp1Pj6fs4jAY/Kor3UfAKz9mhj0LOQB7lA3dlzUv0TVBjb
         Q/YthV88wTO4zlFoqnWJRd6MrLdEGTJJklZuxP6/fEkNK1AYgF5rFdACujnJqp1sNibz
         ckCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922161; x=1792526961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0gpLt7+oS9KQUHShMJeHfOIQi0PPRoxYfM2szDl9BQ=;
        b=tEvAvYi4tcPyZaUjp4n+pmi96cKIuIFWOq4WpmInLFduqydozmbtKnHMyujn4d7YbX
         bEvlOm6obUOhYO3iu8VIz8fwsO/c4BbclyaejwgkcbZCic7XTrYfAg4cLwO1DD+ZigAk
         se/eKMrFO3Mckctw9JHV6K/jbZWVVxlxhdlcKN/9yUCib6trchhfS6y2bNMVxx2C6NXz
         9kio7Zt4VAWtiuhwAYxJSpPRrPbwyNgfWXIoJBxRI4o0lAEVSigBlEWujW++Ki9zYNxJ
         cidbf8TIkSGyMc9W+ddu572bjRXhRebLms3r2iMTbBRYlKYzNCBVVX8bd7Sxso2VHEXn
         CAuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD71xjylvmQiR4lK2QP0xBHIw3ORU4lPWFw4ihIHSOWE5NMl/o8l8C78qvjN8M+GxFSAvNtTZwy0/+PQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ5JSiugiv2ZwEaGoh+L6zelgBgAgzfJ2N5UhTah5O9nl4rXj6
	UGs98TRMc6VjvVoFLBYR7l29W730H4YyF74g+hMFrRLM5nZYBSrsKC0H
X-Gm-Gg: AYBFou3qB8Q6WSG6aySNVB+mKBZvBgKESGIQSumO2AJnajVodqA6QAB0VpcW7XBcvOF
	apR8ob5WK9XiwglsIAnIQfMPkxcgSqi6Fr34Z1RQS+KJoToHFPbEl6shiHryxlKHaIXURvUpIRq
	SktB9Jv2uuAEuan74HAC0lDinoZUZ2V1Ccg0tZJlFwtdv9KDO0RH5LKWdxvne+hvvD3Fxfssrud
	uUDfzSr+4SirIDl5OpuBbANlzUxDw4eIXJ0/6E3gKznnJUlsmapMo/6XrH0GnhNGmDqLSKuPDO3
	O3y8tH/JbbGSf1X3sjYIblbO38ryyib5b0/+oWDaP5dmVy4sClBzY2PgJP+698vhccJDyc1BjTW
	/6mQMCc4p2p7LqVGVKRYOP2E14YrpeT4u9PJEU5LPLqFQYKwxdT5qy55Wujh1wfuofJmeBn32/c
	f5XwHDK07DyBzDp1jKFzoURjy8yrNQFSmkrGuNcQkurJAgEK7cZAii2J+izc3ayllqJO8VzSVWa
	r+UPqrYtwEeR0Ilnz0zURHyscy9muILvzJRPpXe4pXnGEgsewHT7tU06JHjMGMNey9d+sG1dzmn
	gu2Ji2Ngh2vgBHcK/hExWMzNkcz2J9O0E4/rZxVlHWQm8UPA
X-Received: by 2002:a05:6000:310c:b0:487:8b9:526a with SMTP id ffacd0b85a97d-48dbacdaa60mr25864079f8f.36.1791922161609;
        Tue, 13 Oct 2026 13:09:21 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5af7sm7243430f8f.31.2026.10.13.13.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:09:20 -0700 (PDT)
Message-ID: <293d49fb-6488-46da-bd3c-6f8600dd123d@gmail.com>
Date: Tue, 13 Oct 2026 21:09:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/13] Add dmabuf read/write via io_uring
To: Matthew Brost <matthew.brost@intel.com>, Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 io-uring@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>,
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>,
 William Power <william.power@intel.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
References: <cover.1791336930.git.asml.silence@gmail.com>
 <d00e43fa-8f5b-4a8b-8b83-421d637ba519@kernel.dk>
 <20261013141046.GA12680@lst.de> <as6BMYAsWehHddlT@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <as6BMYAsWehHddlT@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 20:06, Matthew Brost wrote:
> On Tue, Oct 13, 2026 at 04:10:47PM +0200, Christoph Hellwig wrote:
>> On Mon, Oct 12, 2026 at 02:21:41PM -0600, Jens Axboe wrote:
>>> I've queued this series up for some testing, in a separate branch. JFYI.
>>
>> More testing it obviously good.  I've been waiting for addressing
>> of the Sashiko comments on the nvme patches before doing more ACKs,
>> and while I can't really judge the code those in the dma-buf code
>> also look somewhat serious.  So it would be useful to get them addressed
>> and the series reposted.  Same for folding in the PI vs dmabuf fix
>> from Anuj, although making the combination work would of course be
>> even better.
>>
> 
> Oops, I forgot to look at Sashiko's feedback when I acked the dma-buf
> patch. I think the two cleanup issues are valid,

I stopped answering to sashiko as it repeats the same from version
to version when false positive. Those two are warning paths, which
should never happen, I'd rather leak than crash on double free or
so.

  but the reclaim-related
> ones are not. 

Thanks for confirming, you already elaborated on one of them in
previous revision, the new one looked to me as the same class of
issue as well.

I'm not sure why Sashiko is confused here.
> 
> I wonder if there are some shrinkers in the tree that incorrectly take
> dma-resv locks in a blocking manner. They should only use trylocks in
> shrinkers and direct reclaim paths.
-- 
Pavel Begunkov

