Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187CE37EFFD
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160900; cv=none; b=COPYRWYDZ9Fp3nA6nD3PNlSziX6q2EozTwe6DL4F6hEPq7Cb4HkdEF/nDh3bA1O/7z9GQLWQDIDaioQ6t1Z2x0PqfS6nqD+W35erdajCr63oK34RYrtM7TMTcifdxj4gBWZz3evkH2Vo3D1K5H8Y4Ucm4MsfHbH0u/CQ7RfuRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160900; c=relaxed/simple;
	bh=+ZgIZmf9vtYm4fJP1fzWGXWsbm0yH84wQAfq5wQGXao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=peqwmKcqeG/WP6ieKPL3EtiovznW+On0KStuDo5doMEMa9zFzdwHq8uxcjpd/K0hk7uLCMIdvhi4Litw/ZrOVSIL8JTaFXqq7kCvn2aG0VWitg/IDSWHaLalUJs8a2tfH2Wv9A8bGwtfkwnFRA8JMYGFW3LpqDdkafrwGvZNqT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=EpN8fr0b; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="EpN8fr0b"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-354ba08cfd1so10596574eec.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792160898; x=1792765698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZxkiz+xTIZ/TNPEj8NCd1tJgQoYh2xpx5y74xAxmD4=;
        b=EpN8fr0bF0z7Y7hYDavNv81rkdB1AhlSI8iVePDHpOYeU4ZVGMVfH23LHIgaPfayxa
         xm1rfhbVamEPX+0CrXVrKQ/CdmajpCwOTslK3ximNP74sQDa/kUL7tGUOd+gLPIQ6AgF
         9wOt5eIzcldcdp+V0wJ3zXLh9SRFF9pdHtz0ojy/dpcEWuYn7o2FX9TjOuwKf7OPyGgD
         rCggOmAE0s/BR04SzWk/p1ACOGz2mfMBdaSazHNxl+SFNr/WiB9MVX3McqVzJ/ZXoKuC
         o9rAw3FLUYgnCHgL2YdlLgl7Nm1gdliehmdd18X5wu4tezIQESsTysbPbbYbVEZGQR0F
         MaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160898; x=1792765698;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZxkiz+xTIZ/TNPEj8NCd1tJgQoYh2xpx5y74xAxmD4=;
        b=ESd20dRDzGfYntnbgF0nZcDIJcdYWV9Qdd8XChQfPbLYySJ+oRNUtbTztXTX7kqmB1
         ueaOR0RLxXzm/NmtmJnex3NJawaILjREgYlvSW4IDP7rQKnkA7GW09tzKwF+EY7Vw4qc
         YhtK7Zp4bH7XxAD8NnOR3RsrtBdtAtEKsKPqRu2Lg9tICTgD6xgNea64550OOkjWLiUD
         QUCnCkvGoSzmogYPpVQV6FgEpA+WF+AxmhzM4nqCyom9aB4jDBpspAj+TrY+Jg0JudOE
         llhYlPDB4Ou69L/Y+zJxJS+fP/Gz5vUa8yXmtAZzoWirgcfCI0E+Rvynu9wsA39SivGh
         bIRg==
X-Forwarded-Encrypted: i=1; AKwUvBxMczRBmYkFbpj3xviA6YSq23LIYQf9Zpw3sFyvO0HN4ej/FolYK2qW6i2+NRVR5CSG4ODMqCGuB3iTog==@vger.kernel.org
X-Gm-Message-State: AFq9FYJPP2/HcEhhyZz/ki0/O7hr1aqL1wyY7aeSZlEJKv8ZhlM1Ip2d
	H+H/4mZPNXgtpGzKKlwR41Hi4ThI1fImIbtOZTsSpqJFM/1rJ73EzFNx1g3O0nc7723ExiPJi03
	ZEsl8jAc=
X-Gm-Gg: AYBFou1i+ZyfNP5i5n9OXY+fBjYMDtw7GM2QPHGQZnt6zmHMxxlLfcFUo9IJ6UKx58V
	vuPatWrfH/k2NSJbmT/kE8tgFt7Jb6SOj0SwOSOvqnAAU0m2bDUHv8KCBktqULLx3680vwrgf8F
	vgjYMe+RdAYeGWoG0HJYMKktuqRb3KV5N8pfr6birQ/X5JTwYiDYJdP3rRUsYe+LZNtpFPeQuZF
	qbhWuQGPYVPIsL7ORVT5hn/xdra4T5dzEWwlDwA49uLsAFu92ZfWSfdCkGQJ6/1LcpMqd/y4qm9
	Z9P45dmafTLls5jKneAeAZj6tFmFkXsWmFFF7vnRXj9SFuinFR2/dHVD4Uh7iZju6hfdDKzRj8P
	FNqgg75I7OjZpAzNJ4i++XJyUrv8vVsunFL6s9OssYMaGibzjZs7/mm9OyJsSZMHIPYKzXz3PtG
	bBVyKPnJid1KaSUM5miDqvSdQm6lpOhTiv2ihTYacx/LpoC6w5AwM+PjeAY1akaXk6X7XRJiZ9+
	arlJ2Wup96oQuTfJQCgGtfPfsmKWfU0+ADxx2CNdt0kWg4TnXkinzzrig==
X-Received: by 2002:a05:7301:180a:b0:35b:91da:7cb with SMTP id 5a478bee46e88-35b91da1eb4mr17969593eec.35.1792160896140;
        Fri, 16 Oct 2026 07:28:16 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm7150945eec.14.2026.10.16.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:28:15 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
In-Reply-To: <cover.1792144609.git.asml.silence@gmail.com>
References: <cover.1792144609.git.asml.silence@gmail.com>
Subject: Re: [PATCH v2 0/2] clean up dma-buf-io kerneldocs
Message-Id: <179216089525.2070939.12960580037397248054.b4-ty@b4>
Date: Fri, 16 Oct 2026 08:28:15 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 16 Oct 2026 10:58:29 +0100, Pavel Begunkov wrote:
> Add a kerneldoc for dma_buf_io_init_map() and clean up it overall.
> Targeting the Jens' branch where dma-buf-io sits. If preferred, it
> can all be squashed into
> 
> 0d3120db2cbe0a ("dma-buf: introduce initial file I/O infrastructure")
> 
> Pavel Begunkov (2):
>   dma-buf-io: fix typos in kernel docs
>   dma-buf-io: document dma_buf_io_init_map
> 
> [...]

Applied, thanks!

[1/2] dma-buf-io: fix typos in kernel docs
      commit: 44e75dbecb19579db9a070ac8d5f7b400297c1ec
[2/2] dma-buf-io: document dma_buf_io_init_map
      commit: aeef964d73dbfd7f477182bac934cdb4087d1724

Best regards,
-- 
Jens Axboe



