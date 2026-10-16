Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3038735A
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179643; cv=none; b=QtQad+jH2aOvgzOkjWrDdEKwOuyVS6tdRWUhc3DB73RYJ+Y6v8+4DyUzMkeiuHVeyFtmy9ExNMjoV8wsx5v3edjhy+LOf1GzA1eGcZMSMrfXgNWaorAwf8M4lJM42spUyjyxxeKhdjJYCZcGK4L7xgt2TNNBYaB2XbWB3FjZDcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179643; c=relaxed/simple;
	bh=xXQUv4FgmNf0JJMpp6ecZtgviJ+BWlmyvg/p6z47y0I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xg8CzAvlP768rjm0bFP1EiZzndVXLmtJCBdLXD4Ju6eE1/5O79Inf0ad27BPxy01yc72qpZ+XpMvU+49GMNSzasPIxbYTEVF8bUwhozzZ35eCU+g/9VyGWd8FtG8PpKy04qET6dDJawMt/TWXfbvH5SMONE0k18zDsnaaZDU5fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nqDpTI8e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqDpTI8e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso4231085e9.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 12:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792179640; x=1792784440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMRRI5bEPrjeiE8Y1aI7MLDO6J4IuqM4URq6dJXpjo8=;
        b=nqDpTI8eFTWXAD3QGMOEkfLq72jJ7YDmomyAJ5+A8WuG+bj4Utv3TmRbv74qpExEHQ
         J5gJhzzn2cYoNsoo8Je0k7q1U+Qvpar0KGVZETfoCQnoukZMJOPUD6vrd3Xblu58g7Nt
         2as6d2WSYXu3YfbOE1x7xcvpfQIprgl8uCT/7LA3iNxA7GLGaJmzze0+/e8FEhSNj56l
         KH0n85AB4F/mZ8R6CoaDcR3YJEzTrNLpA59VWhHPIUeeiKHRSMyVtvjKR/xc+i+zZ7Sk
         1k9On+3dGj3cCatOEzKAA9JiCgBuwrz2l3a7QLyMBMsvZmcsxi5S9XE7Gi+qmvBJZ3Il
         x/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179640; x=1792784440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMRRI5bEPrjeiE8Y1aI7MLDO6J4IuqM4URq6dJXpjo8=;
        b=HzWjp4k4IcFOq/78kEVRm8TmEDTe+4FJFCB/gQq1VssOD4FA2GBUukt2rwXXk8hLTk
         0tqrfbe6hdCpFjDSdT7+s1+mpE6HC+SazVSCxN50o2RFiIaPql7VElLqOoyCSAkQs2+Q
         cSRrDK2HaLMTaMFJxcVzNknOBoDXvfJLZILAaaOTuEYkUIORpgYuvwzmN2vhUZLSnYMG
         oJVqWwIgj7QK3eEyMgwTw0HCQ+naIu28htp/6dgze+6sSlcj0ZEeTGfQM3OypcB/hXF9
         xYoXxU83MetD7mMcKQC2/cQ8aWIAOf1MVXkRmyEMuHYoVyUQhj5jbfdfBVxyYkYdOJO6
         Vs/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZxM3A295QQ525KndTifm9fSgO9LyYSBeVGg6YaUNfpqFCK0uNNyEdJOKyKdEgQw5Qjzk1JCrRSShBKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI81w59cESogwRUyBBUledbAw4UiwWUzYi4cclmB7AwdqhN230m
	o4CKpSNaeJVW8pKFRCGHzWY+FQRcsKTd2ZScDrUyICLMQY/zzzXiXOZt
X-Gm-Gg: AYBFou06ZKQ6ndSUqoZS/9umNcWn7Q/OZIw+nakxHwWBTlWpa29KbDOSdu758FjU4GC
	tw9LJJ4e69taYzIO7MUJMiVkH0YLT4jK4m02rnw3SKwJ5Ak8E70wQwBZCob+ULkV1O7QG8ff+4g
	sVJArPUHlbuzgmv+7Ce0rjalWEwWjHwwMQYlYUiO15EkMOCKO5ljYH/yIKQhjU0oZUhpS+6dP1V
	SFbV8O5nO1PvZbZ79yV3OkVngap4UcfsAzd51q1kSHjQ2jdoo/Kp+3keXzRtdRM5sJNmQVfy5Hp
	/5vw7CJ8xy8Vlz3PBwC36qswQgi3AUMuBriyqzLsKzTxc1sntaBCijQigz9w9609HM/ggN7cXBU
	FBtsuT43JqERvk0PODBbtJHxwcmf1iQ9F/LtQTsxbu/xCaBL9zlMTcrJiLOtGaTwHdWJXN5LFX7
	TRhdKL+BeTgVK9n7NZ9YVjscMfuJNcOxYtuPdHeUd4Yd+OP9eaHP2XUdRLmTAEndnAhPfbJYcbL
	uLLEqCo21Gvmdg/HqvLGhY/CC1CjDzJJNc/mpjBbFagfKAHLI+shsk9EaET/FwihwN8qSEHNXvU
	0C+LRGbVbiSx9L3Uv1nOEuRPPpD9LlQtXDFCaNGyuguVj3vBl9hUA9iJD203wAkeZK6QsbyMaIZ
	EIrxHM0npRJu0
X-Received: by 2002:a05:600c:a102:b0:4a1:bc14:224b with SMTP id 5b1f17b1804b1-4a1c66b37cfmr83617395e9.10.1792179639973;
        Fri, 16 Oct 2026 12:40:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm7026413f8f.48.2026.10.16.12.40.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 12:40:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Dongwon Kim <dongwon.kim@intel.com>,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH RFC 23/26] iommufd: Use the PAL mapping type instead of a vfio function
Date: Fri, 16 Oct 2026 21:40:22 +0200
Message-Id: <20261016194022.62065-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <23-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
References: <0-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com> <23-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Feb 17, 2026 at 08:11:54PM -0400, Jason Gunthorpe wrote:
> +		dma_resv_lock(dmabuf->resv, NULL);
> +		if (pages->dmabuf.exp_phys)
> +			dma_buf_pal_unmap_phys(pages->dmabuf.attach,
> +					       pages->dmabuf.exp_phys);
> +		dma_resv_unlock(dmabuf->resv);
> +
>  		dma_buf_detach(dmabuf, pages->dmabuf.attach);

exp_phys remains non-NULL after dma_buf_pal_unmap_phys() frees it. A
move notification after dma_resv_unlock() and before dma_buf_detach()
therefore reaches iopt_revoke_notify() and frees it again.

A test hook forced that ordering on the posted series. The one-page
IOMMUFD selftest unmap on arm64 QEMU with KASAN reports:

  BUG: KASAN: double-free in iommufd_dma_pal_unmap_phys+0x14/0x20

The first free is in iopt_release_pages(). The second is through
dma_buf_move_notify() -> iopt_revoke_notify().

Clearing exp_phys before dropping the reservation lock makes the same test
complete without a KASAN report.

Karl
