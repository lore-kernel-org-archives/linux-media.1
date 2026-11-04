Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751561;
	b=m3dLVa2RPNoBtDoecWxN7UNmSO1dJDfTtyoSQnfkZvTiNyYuFNSzpLqvKaU+e/t8VRw5
	 k8vJihLFkGyqcbR/oHHbXqF/ENrNwiB53ro3cpIryJMeU3rAcBNwQR0e3ZnnhWI8CDsN+
	 cKTT6crWA2mC4bMdtAk6qZh83NQwSqJFA7tNXKa3Vu2XhWezEJBc1vKKQWUEBD2Yq44H4
	 Akz3VWvGOUkW4K7S213yOmCLFX8+3gOx/LSVTu9UfwBdW9rUOmRKG4o3OmYDz/NZk5za8
	 UBM0Mn8GLtJDUR93qK+2odl4lcC60i0iw14mkvKUU5AxptAiirx1L5Isj+qwcssy3pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
	b=zin48E+Dk8OLbXnBx+RxHlZzqsyFwMPiET2XR6oWDQYe6shAnyzb0NOfcKuZfc1aulcZ
	 wvc0RK/4QZyXBPXQBs1Ip3OuONOhGonVUEgFlwSqrpuxgf7YxTbsLQk6c7euUyHjx8chu
	 nrosV3Ob+yjrb17KisTst5J70eTtDwvPqyVd7lDwoDNOqfnmmlQ/+tiAIZpNoEceUkoUu
	 CB3AeVDEGFotnP1aTXr5n5DTykpZmnQhjxx/QKod8hue0Uq4GfFtKGNZJc3rBz6uAwKTe
	 OMJAPJDR1hqyJIF/Ad88ece2a0Z8wknnteOu0dlkl9eyOBI/RtyW50EQZZT+bQhlvtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4bw5pwH;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97161606A324
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97161606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4bw5pwH
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so126764f8f.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751559; x=1794356359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
        b=C4bw5pwHYHKdBx7XMHDV2xpsCjhmtYFZlM0xZCGGFxbTeRU/HKmGYdlrUC0OpsaE76
         sxmnko+3wk5uDyFU/+r1JLpCP/eP9ukWXMWBNJMCD40nKwguWgcqYGGYt+IE7ll7C2pf
         o7W0xco1UcZ+wNXkxSW7dwlVniMCkCs5ZEsbiySzJNn0p//HrTw9Z7VwZ18jlUf8rH/i
         FmaFm9kX1Qp6PWhIQCdFZ15FF9zROPyZ71eO7A568PBC1uAFunqbyVVs6evwu0/IB0ns
         GY+oEPG4GDDP77pRv2pubjSoD/BxAS9jl91VHj8CzE8x35vhARJmsUOExuPjse5frMXu
         2HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751559; x=1794356359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9rahWNqn5TrjQs9MBNRTiFNXPe8F3h3uvk3o1ZjbFE=;
        b=LF/uUgC2B1UlCx9SpnyiHn5VbhtlcOYPqiekUzFfyv4NcaUFedGpz8e0fgEcekeQod
         1O+CeqQMKuzCzQv2CCNdg/db1FeG3ABNvwZZWDzT0xyj2Y571Ta2pm/Q7Ju0789WOYBy
         qqpB8MRV6onWNsID3fwmr4rP07rFNNlm74FCwfXaDEuYwhX508IXw55Ye6eSRLLvIgFb
         C2eMSuVl2Pjh2IHg0je3Q1zNJ/USBkiamNkiMdf0VxS9U+QvEPEhEjBWYFeqshqm6CpH
         /9L/9Nu5LXO7UBHxePUc3ntvBlDazYqxq6z8y4BBYB/UwSxip0cbSD1DK1dDhZtZ/P2U
         0PKw==
X-Forwarded-Encrypted: i=1; AKwUvBxQiSBjWIgOCZSHnsOmVDY3t5r/ctI1CAOIjz5Sf9ZFWarRyhvZ2nNQaee4iqFe39Ee4SoHFZsIsl0YAw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dSeva8cKODpqzl/ljPqLHlLpgMq0xigT0sGdjgUGF/B4X0FFH
	z99lqSx48ob27eedUL/DYPB9vy6tt2BzHRduI4agAegXjNWnOdAwuSjm
X-Gm-Gg: AYBFou3oYMlWq7BsbDEG74sjQCJs4oe2Lt06H+CmHciwwuqHKh962AKlmDfQX6SYaT1
	tkTFCX4Nz3SnzmPSW7p+Fmdx73SaStYoM4t7bkZ/5fjnsT0Yvc1yfuVfL8xH6lmU5HiuUFpk5+Z
	C3jJzM53RzD3zy8dq/X8qWZeE2ZIcBqySCLu9+f6hSabuSb/NIyBbgECCn0+/mKUbpBduuh0KI2
	8HKvGc6dcD49IiIkQWTtjMQqQSCZPSJ9+yeclwPYwP2NA7qPJXt/WWDBeMpNEPR0/44LvAf88a0
	vucAvCaYhDdEbEvuH3+/461khxZ7eoOQrHkYpo52T5rAtWedgDfkxQ/RxH/1uiyquG7i6HrH0/Z
	h27/iPMktZQvdcd4AiFUCUJpSlQcX0HmyHA1C6ZS2qMnJGYqRm7EAtGT7JIGmgXlSlZdSdElA3v
	c07yft9S5uaT2prjgn0fXZtYUQ0Z53f7jR3ZjDvU2r1frymTkhU7kY4PpWQzh8idkRjL0urGGg+
	gdqzBw8iYb+3kSUwhBy+r+x9/A14yr8nGQkejwf4Qra/k5+4JxISVhIBG2vFnI79ZxwpvjfHwNm
	jJ9zDpGsLqcKw6/HadGy1sFnOZZ1ijTyNnO8NOt08IOJAzZYKkl0OE7I6VfQq1RlaKtZx5OPrxZ
	zs0whwE8/mITiEw1XHvwRZms/I0jMiCY=
X-Received: by 2002:a05:6000:2dc4:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-48e6e535ca9mr33172348f8f.56.1793751558968;
        Tue, 03 Nov 2026 16:19:18 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:17 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 2/5] block: set dma-buf-io tag to block files
Date: Wed,  4 Nov 2026 00:18:58 +0000
Message-ID: <91697f770aa09d1be8f358378f1e11e0143ebe5d.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1793751001.git.asml.silence@gmail.com>
References: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to set dma-buf-io tag to be able to share contexts between
multiple files. Use gendisk pointer as a tag, this allows sharing
b/w different partitions of the same block device.

Fixes: 839231d19393 ("block: add dma-buf support for raw bdev")
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 block/fops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/fops.c b/block/fops.c
index 60b9c9b1cefe..6f013780b76b 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -687,6 +687,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
 	ret = bdev_open(bdev, mode, filp->private_data, NULL, filp);
 	if (ret)
 		blkdev_put_no_open(bdev);
+	filp->f_dma_io_tag = (unsigned long)bdev->bd_disk;
 	return ret;
 }
 
-- 
2.54.0

