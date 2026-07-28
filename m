Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2402C0298
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248249; cv=none; b=VeuP8y/mMgXaIu/P6vpsRp3HRBVfr31JjGRQyZwO+Txyf5zx6yzHGFWRoINipVOP3/E6tlzp4pJU66wJE5NC3HK+1B8dlHAzHDG6sRyMCyP6JlewQVIBjfC5gmveMRhWlQY/JWWfJ06Yv3+KftS67tP2BNmhNR5A3VfHGi1h4tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248249; c=relaxed/simple;
	bh=smzarBw8hIXsOkcyD63/FxPZ8x4SkIwRndC9J2JSFsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhfvQ3MpAdHJHxVp4B97eiXzkT/maNXPcLte+uc0IZjOLtxFb0X2bZQpYGPbYLYrdIkRw2jNSzftmztCdUWov/YpDuvnkhOvF2uyI3PimUMUE3XKWWjWj1G3s+t6ZMc2VF53+JeJjKpEJrvgBlN4j2rJrJbovjdhsky3aZXO9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlgyhZun; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlgyhZun"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so32331676d6.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248247; x=1785853047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDLZZq1JNAih3SrfuWlz8fYPYEmLTTGnMNftSwGkOyk=;
        b=UlgyhZunb9h6z69RAwhP78q7O6nQbxcAYcCeFXg6jin03OMZWlHIo+l8AEip1XpAgQ
         rjE2TIQnlhKwOXgs0djIsf/xI3WiLEgkBtt6fjgl4x6PTfExcSBjK2VBlI2+dQrk8A+r
         pDI8cbZeOZqE6ciJMmcQ4RJgOcLdy9tvOr15su4lvI/Ndg3X2NjLxduWDE0prkn0wBip
         DJdicizdyc5foKTrvHyFYgfXEcQR2BNlnKgkMyqHGKcKGxTPnNfH3Wc0Oqpy6hVvEkG6
         TUV0W/K6K+dGuuw7yu6J3m7aJEWIWBtxjqEAZfI18toaza2nkRJlfhuvvqKcEvE7ygFX
         B44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248247; x=1785853047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDLZZq1JNAih3SrfuWlz8fYPYEmLTTGnMNftSwGkOyk=;
        b=bk6MYj56IZ2UamyI/5o8+7ODDRMD9SBzvHFFSSX1P/+FDWAbVdnwPP3cKUn08aQHp3
         3Om6SVDpNUODNTFK3UMyQYP2Femy3zr+AdLw/D4HZTuSY6tMfFaZXVeHMnZj9xmILEdC
         knq0Vd4Jdal/pObMYHqKFwTbwhhAmw1da2GpAZr6BvNZVEHB5A9ufjn0f83znb3M2hBA
         yQNZgoFDD83GE3HPOevGwMLiV/dlCP9GZBy7GU6rX1anJlT0ST6NGTh0B9WfG9u+NCSp
         bVrEXjxeadZKx4W+YfcGoSf6CIjkgGcK53RTzqAKAR9npSEIgSVxxJ4BW5K6wvBrQSry
         2A+A==
X-Forwarded-Encrypted: i=1; AHgh+RrbukhOtp93DvoXjnj5aaCfMYHIHP3oin1UzQ78keEzIgdlqmKK3UeNbU38N3QG4fOA7qV1HPLTHAnoaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxMG2CzHqOCW1vTpDKGJDhGvn2vzSvVON5l3mV1dIynnwjaI8l
	b/fIZMiflhqzuJxUaQtK3o2Sf3+Nkp8jOJI7CUeGnEVxYuORm4he7izl
X-Gm-Gg: AR+sD1145JmRd0uBgaakX2AKsuhbvpkEhm+WQgvsxDCK4yEykMMZW9LKJUKIegwIrOJ
	0hE58qRwHLc9+JoQxDWR4Cw8wEi+etLklb07yAkMv3h6FecxZuB5AswA8zhYYcMBiPYE1VQUbv+
	JvJ2gzgUhdxhimSSPLnUf6pJNqaElpCf1/wm/yQRlDH7lXUQ1F0PF5H1zZjG5AZ3htFHvKs9/Sf
	KQkHk5aBQ3jTZVU5TYYEFv6m8mqCrNgxNaJ8O74mZ3bsinMIdikxoW73dOwsgEI7f8qytE8Z+/c
	UnTrxjbJ1meTACVmJJ3knN3aqwExYm5La2L0ehvHw95CVGhnwALin5bOibT/lB06TrGEnOFnyJR
	t3XorurjKMtuf7zETWzBtRDwj2joebdMWwBfI9EaL0nJM4bahLTVmFhT6WfrKfiCt8mCOcWZ8Od
	cPKXx+YnCP45FSlRvXwXt3933x8gQPvoeRvxe1Hze7/cYzRA0jukmwc+o/
X-Received: by 2002:a05:6214:1cc2:b0:8ee:756a:f1cb with SMTP id 6a1803df08f44-9081730669amr25567036d6.28.1785248247344;
        Tue, 28 Jul 2026 07:17:27 -0700 (PDT)
Received: from LAPTOP-DPAKMOI4.it.purdue.edu (pal-210-106-74.itap.purdue.edu. [128.210.106.74])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dd3b56esm85856d6.26.2026.07.28.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:17:26 -0700 (PDT)
From: Yifei Gao <gyf161023@gmail.com>
To: Bin Du <bin.du@amd.com>,
	Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sultan Alsawaf <sultan@kerneltoast.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifei Gao <gyf161023@gmail.com>
Subject: [PATCH v3 1/2] media: amd: isp4: release partial allocations in isp4if_alloc_fw_gpumem()
Date: Tue, 28 Jul 2026 14:16:49 +0000
Message-ID: <20260728141659.62310-2-gyf161023@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728141659.62310-1-gyf161023@gmail.com>
References: <20260727183500.298036-1-gyf161023@gmail.com>
 <20260728141659.62310-1-gyf161023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isp4if_alloc_fw_gpumem() allocates several GPU memory pools in sequence.
If one of them fails, it jumps to error_no_memory and returns -ENOMEM
without releasing the pools that were already allocated, leaking them.

Release the already-allocated pools before returning. isp4if_gpu_mem_free()
is a no-op on pools that were not allocated, so calling
isp4if_dealloc_fw_gpumem() here safely frees exactly the pools that
succeeded.

Fixes: 4c5feef6a62c ("media: platform: amd: Add isp4 fw and hw interface")
Signed-off-by: Yifei Gao <gyf161023@gmail.com>
---
 drivers/media/platform/amd/isp4/isp4_interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 8d73f66bb42c..8e3616cce479 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -201,6 +201,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 
 error_no_memory:
 	dev_err(dev, "failed to allocate gpu memory\n");
+	isp4if_dealloc_fw_gpumem(ispif);
 	return -ENOMEM;
 }
 
-- 
2.43.0

