Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300351;
	b=a10OY//WbFtmIT/1diBljLcOZXSgHk4IwhSGIXl+J84Z35UugnpzK/N4pc+a158Q07fw
	 ABbClGuE6AuYe6AJY7nHrhOlVmwdY8f1JpZkHQeuSuVVSnn7IRJO1CGztrwYmyZVbsdNe
	 KSvFzm3OuWIv9mnDcySEGnSLAxcQ0q3yjk5GYlaX4Arbca/5hw0x16ljx+QkGBpTYoSXB
	 k8pSy+746kRmiSHLGrm/tv+2RLQ8Q0oDVQEPlFnZf8vB6wSIVblJTv/jBS7dNl1X8NwJZ
	 NfB+NGHA+Vv27tS414Z5/1RTuHW49IWR0cyRAX9myJ0d4UEBIheFMKDRiaAphHjp/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
	b=Wr0hfsR0kpfzJkzbyImD7psJZLM8lXs+MmxQGerKm3PHDfuLZUFTOVz/XEVSVQRkHiZE
	 S3HixgvsKxDUyBm7lla/fDgT4q+RgIT/kIjTBbqtp3KyDey6fpWFBR8PITUEdBxVorDr6
	 1Vpi2Wff1+H8ZGrXGjYEhV+DA3d/iNjlushW6qBwdv5aHqTKqbaev7AyJjfqBkGHrc8IK
	 9eJQFmfmvhKHfBZwbRcpDFlKbcCD+ut89aqAfZ8qI9XdToWozqJ0o4YkBWc1Fp6MmYa33
	 pC+iiBq8zyXaABowMM/XxwF0IFGB/WDLqO32V/jVBgggLUNBA+xNxxcwlrPXW2pIQEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102E606A325
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 18:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E102E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKHfFSVm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so23598355e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 11:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300349; x=1793905149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=wKHfFSVmSHenG0U1iwKgtGSi1UOPPzW6SwGJPjDKQxqwGUCxJEvCn1DjSm7x+7dlBI
         tUKS5X1HwuZkVolpmPhJFNwbLcWP4O2Ey+tlKOMSKe5uAIMYifWViWBMbQNK0ytgnkU5
         TxpYpjDnhF0RjngKcgEl1OEsxC/rdKP63x/HzurTG3ZCmbKYurx/pMsgnAebRGdPVULt
         X6kw74+yrE1gmuUM1siaydpKy5zusToKzYM/zlLOoKSiOrcEwuwMelyy8U+A1MF4630N
         +VRIg7uYp5Eams5/R4YrzMxIRDiBSFhS3P/ldIwkkN9aFhmNkbr/qpcLWvL6VVYZuboa
         npsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300349; x=1793905149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0Ytmrnk1GXIgM1fqIrHZ5HsCVM2IH42icX0Nl0p4uM=;
        b=UxJshBlSGnaP8BzR1R74IrCGtp2q2bm1s5Nuz+F43eNMUp5puvNrEL2A2hd7LNXMz+
         LCvPMvT+gGdU2p9UCq5oHxpzcbRNm4SqHTRT0Atyg6/WSPZEugI/FHuho8b5/RoEWVeb
         jBKQP8hCE+Mxm5QAityYirQ9UD9CVsqTEj5r41wY+hjoJXdvtb+lJhtXnPsqz0lWCdpU
         EKk2BP4dlWkeJ8K1lUMQ97IoIk4oiKJb/bUmcMbPziHpC/JnINRUWq4s8C4P+hVcRTG8
         IMvkRC9E1ueZ18DH8WpF4zq8XFfSg2tx+0lVqDDyDaC9TeI0qWbBZnkJsmwS4v3vYOLA
         sNqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU8W+Dr5nltIwsNI/iWe6AYRxG/v5M5wRHAkccAWcDrxf4h3yl2xGTX02pdrB95vSJkbDlZG3lYb0m6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxsDLl8Ag93mjshwXrCx2ETVpSu6FtHFbRww5usNldpyjirJad
	yKbzMiDgKNmknOb43aBqO6z7XMdhLocsspTb4Q2vyK6lWrYl83t4oLCa
X-Gm-Gg: AYBFou1VbpIr5imDQylTo/4iE4BbagjXw1FLJlSMrK5vzm7d0Xpfm1+AnE0SAbrZ0V3
	+apW21MqkRXitlpKUz4zIKVFIW4FtnfNspTtsvc/NGkswZhGZnpUmSiHup6xQmKCvqh7QNnV5QX
	aV+7ZIY4R1dgbOsRv0qTAtM11vI3wPKQJc4/h72HtR/wjv+5R5pXMu7rNi5bvL6xsNDV77B74yv
	uktqGDCtFC3IX3v1d+6iAbhpENiaysNDDkwk9SAtMiewFfSpDTY663ZxFULWXMpU4KDfd+fbDtZ
	bxeyZ4JeIekNTLwhAKGtB3zt+EFGRNVZwJNaEfE0JhbHDHYVPLh4WRvDRSUC80a5bPlZlRle9fj
	ZjvRyeOt8mjFNGm3HG5hevsgeDmucREBcric7LTt5B7W02xi9PVSkAWzTNxl/upymAF+g14NWU1
	tqSdAJ172Pdmr3WfKC7CRVmbtz+8aNhy7rIargHT8Th2DV77U+iDWob9rzq2t2neUgo2Aux/N6a
	skDybjSOFIBwX+IGb5BwFqDKUYc1MieTEToFrbdyNlw+5iOb+N1NBahi8RmHLXhNd80V/p+ychV
	+G6qWgxozU24tY6DZ6cyqpR+T2fc65OPepFQAD/Av9DnW1CHJvZFkZlo/g9F2w8OcMmwrBDHWFy
	hOd0p17GGVPsJ4cXx39hvMyXAKIjeRsvCnW2jeivH5Wa/2vRwGJ8HZAldLoPjSEkF9JXljeZkub
	O50VGonSMp2nsC
X-Received: by 2002:a05:600d:4121:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4a96836988amr152798385e9.32.1793300349381;
        Thu, 29 Oct 2026 11:59:09 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c76507sm4933955e9.10.2026.10.29.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:59:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 21:59:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auOXeGVQG0UHeoQb@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>

On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:

> Pattern C: ret > 0 / ret <= 0 / ret != 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!= 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<= 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<= 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on = (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<= 0) early
>     return now skipped, correctly proceeds.

Pattern C is mostly bugs so this patch should have a Fixes tag since
it fixes bugs.

regards,
dan carpenter


