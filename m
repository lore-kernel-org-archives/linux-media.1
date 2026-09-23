Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F945372C8
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175269; cv=none; b=KdH8suyzL3X8vWqNpMvMY/5FyxGBAtfvPHYSdbgEwrmxlEEafBCTiHV4jlqdLR+1uZCYctBzPkt+wd7q1kDqIkrJTABaMK93vgaEceDCfAgp7jp/Y/NzbvGSLDGqo5E/MrSmclCX3wQGqHq0RdexkujtFrxgbc8asEXHkvhTc8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175269; c=relaxed/simple;
	bh=grNhK4RuhbgG+UJZXEkOCcIHqxgz19dtDps1emrO/Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIyOR6HetpDZizP6Qv7fO77wkzCIvY6pZJ0R+A9MYdKrzPnEUnZepPsLl/ASHL+GIwnQtYRK1NAX+O5LFC9E/6In5A2o8yuOlPJ9AVrqo7rfeS2YV8/c9sOOk1P8c+33Hntjc3Cp3z8Y6rax0NMjg6xFy9vL3XIHYEmqtjZVjr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSOVMZsU; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSOVMZsU"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so11769995e9.1
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790175265; x=1790780065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B9m1zVpzXmusL6/SYYSJod90oa+RXk7gcOYwrRLctmI=;
        b=RSOVMZsUieO4E4zfRrEv3LvfvGbGucz4BccY7ZNMs4d+m0kvgWR1fp1xvoFv8UrdWX
         Z54iA4T3sQuI8tE84nuVvwGJn26DH5kI633bscSNXVh/yaoh7YAAcuPigm3nLkH7/E2m
         QeGbCxE9gI69CRCOxYNYLJcVCuOuAR7CDg8AH37IrLhXvT2A1++yqt9RXdop/k0pxgDm
         ZgpZFfDTVdvSpc3Fi4Sla5S4fOo+Sy73vTbU45k4CUvK62B7ynADl3QVQzb6OCSLz5uA
         i5emG7LYxz+LvugHMm2dEydlcAd/5wJjLBU0iAlALW/yA2cocreBZtFCtscUcmf9/1LU
         T95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175265; x=1790780065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9m1zVpzXmusL6/SYYSJod90oa+RXk7gcOYwrRLctmI=;
        b=RdT2o325ZhgzIL21N/byF2Hzb49/FYFPE56lQB7/yqw/ec1uqVpHth0zoVIcmA+MaO
         +UQKPaeS644bVy/stOx/z7QhrIz0wxgWbcoUK/Sx3rXg4fqaRcpreQoQLvUH/Nor4kwP
         kiYzQvXgYPAtciEENpJPd3hCrWyT+++fRE/Dpvn0WNAG7WTaVpB0ovejY/CZXeNElftR
         MNDUvUj1czn5gS9x5xdDDQ5jafKCxputvY3O2amBOZmhXKAIOVLzzkRfHfk7D6Bs6WDD
         /ywNbBPZhrC6iiGK247b8PNHb6nkLMD7QiLhR/PjGHEFpmghLK245S3/CVx4zW4q2OCZ
         F8tg==
X-Gm-Message-State: AFuF++nLTsKtXba3oLycQ18QRVDBFzgjQMFOZt5fSWzsGz7Cu8KDlyzD
	xjdWQn/FLZ4cFaZ1+MAbtSqheJP+hK6p0BP5wZZi0LiMd7zW8pEve8VD
X-Gm-Gg: AYBFou0orjmfanqPuZRzRokhHiPD0aqVobb540tfTBwy0yEDb14Zrh8AuU54YR/QCWA
	ynx8SPxYZDfRBgH96/TG+az3JfgLAJlsfbKss6Sn70XihhwmNuO7TP3unqVb7n8MMGKwFQobYrQ
	RG4mtfBrN20F8nmShFCm723Hhu1ItWuspF9cB2Z2guRLtoeMVojDNKLSKoVZVvD9/M7Bt/9v1Ng
	k28VlXevB5n+PIbM6eggyCm0DNf4xYzKBnSCA6UtvfWIf9Cb5J8f2lP/QWxeU4de2NVYxkr/FTp
	C6aVp1+CRS3mAln/eUDcR9DGSvyrqzVWjEYVJYNoWecpzq2tGlZ6S7UBA64oldI3hEDv41x6dmQ
	7hVYXOjp+XDZMzEnryE8LipQHROtznMRJAxkSVM1aMCjaCAs1cto7jQzgTRysS/wYWZMTAXCDBJ
	CaXHZixtLGb+orQXa/2kl6Lx6L1G1ouP0VQvaM3AANgS44HbfUGHzHp3p/IuZDl+1vaqwMvZoyO
	scN5R+Uk/bvFJz3uOXR8x266n8kZnf4QfTD47yOMuhRctOhul6NW0yoJ1qUlRq1uO4sw6kzBSJE
	3NogEzJ9xRLuhI8yw3qIMhzd86I7Qe/1iq513oxgQ98SM9FQJN1vvw/3IZBNIBLxVUmgToofHPn
	SkoFMGLXgCsfAPYT7/gJzym9/AjhfPLDR6vJmfWPPgUbTB2L6Gl8=
X-Received: by 2002:a05:600c:3507:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-49fdf12bbb3mr42444245e9.22.1790175265066;
        Wed, 23 Sep 2026 07:54:25 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe41b8446sm6914605e9.1.2026.09.23.07.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:54:23 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com,
 mehdi.djait@linux.intel.com, ong.hock.yu@intel.com, khai.wen.ng@intel.com,
 antti.laakso@linux.intel.com, manik.bajpai@intel.com,
 divyamani.tripathi@intel.com, nicfio@gmail.com
Subject: Re: [PATCH v3 09/21] media: ipu6: Start streaming once all streams
 have started, stop when not
Date: Wed, 23 Sep 2026 16:54:21 +0200
Message-ID: <179017526193.315162.9897874972042062382@gmail.com>
In-Reply-To: <20260922120538.896684-10-sakari.ailus@linux.intel.com>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
 <20260922120538.896684-10-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Tue, Sep 22, 2026 at 03:05:26PM +0300, Sakari Ailus wrote:
> +static int ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u8 *vc, bool enable)

Thanks for picking up the return value and the inner loop key; both
read correctly to me in v3.

One question on the loop, again from reading only:

> +		struct media_pad *video_pad =
> +			media_pad_remote_pad_first(&asd->sd.entity.pads[route->source_pad]);
> +		struct ipu6_isys_video *av =
> +			container_of_const(video_pad, struct ipu6_isys_video,
> +					   pad);
> +
> +		streams_enabled++;
> +		if (av->streaming || (enable && pad == route->source_pad))

The CSI-2 source pad to video node links are created with no flags in
isys_csi2_create_media_links(), so they are neither immutable nor
enabled by default, and media_pad_remote_pad_first() returns NULL for a
pad whose link is disabled. With two active routes on the same virtual
channel, say one per source pad, and only one of the two video node
links enabled, streaming on the enabled node reaches the other route
here, and av->streaming is read through a pointer derived from NULL.

That does not need anything unusual: it is the multi-stream setup this
series prepares for, with one of the two outputs simply not in use.
Even without the oops, that route could never start streaming, so it
would hold back the first one forever.

Unless something earlier already rejects such a configuration and I
have missed it, skipping those routes would seem to cover both:

		if (!video_pad)
			continue;

Thanks,

--
Nicola Fiorillo
