Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626795;
	b=vkiQcQjziFA+pBF6GEOpwum2TFZGgMIzzyyrRtey3ftYM8asA5CgGD/Bmb2ufvnP7KV4
	 wzYmPSexMzLihWBPLRAgHOTdAf0bD9EHQ+gI2pO9XYA3QZOWNd1tMpBRSQcF3Y0djkEhl
	 LoK+W+NVYV2syv7EhTER5Il51+qijq1mS/0YA2FAePt/E8JE3e7YBkrhBZKxJL7OLcAfm
	 7AbIcSUDcf/CrQ4ZXq1+tbYQ2166BsjgkSfBHedX/LXV9Prjgto4JraFzm+3cDdCnL4jr
	 UnL70QBZAkvzQMwch4knePo1Y5Wicw8AJUIHzQnyBA8zuTOW2M6i4CKpqWy/HfsrFog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626795;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
	b=Y2iOBnXKft0h9LWpbeCi0mD6pxwkriqrOkFXdpPSmv92Z1LIE61gIhul5B4+neVStM++
	 4yGYEOiXHcTpR7Le15eE8H5VnWO5TkRHplIaVWp0Ub0lDF99SgmrlyALIF2uTOdBqiiY9
	 OPu1kZ98iCkGuMZ9wFP1dMoPmpCjvRH9QsiIc7l5NYWxFlAkiTv6O2Y4Awi+GgLOEWr/D
	 be2VY4doLtNp+nif607PmaBinILYOoH+55ZoQ326ltwBTExppcnRbbmkz8KDFH3Cy7S0a
	 Uv12sNoWJjtdFE1jg+AveV2gJ+HeRl65Rll0TKmxf9xAaIVj4xGtWIxxWUwTwtEj3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZGSdvwD;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA65606A337
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA65606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZZGSdvwD
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ee2072d1e7so3243475ad.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626793; x=1795231593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=JZQx9NhYoZcEASFRvtWQwvU7qjDz0MxjDwiA1MAK04vFeWgHjUA+PaV5ecu5BuJqTP
         WmsX6KZRaK9EvCoqgTgYi5njOi/a7/5mGbhBmDRapVx6SrVUAYZsB6nEAVG1s/aSota/
         wHaOg087xfVybnUXEV/1Lo448T/K3aTKbr3W7BVbd1QUxZQnk3WWOmMwLxEfMtSkyrjs
         V04IzTS6U819Qd781c6UhvZ23e9i1p42qLpQC0oQk6LKvuuS24feY9D/m8TL9EAB8bcL
         9/XCwOXhkCYZU71fDCieLgBnLwkH0ojeRSk50CLlGefaYQ/fQwHKOyyEBsjKiDlhil9o
         Nd6Q==
X-Forwarded-Encrypted: i=1; AL+hErGq+8km2ksIcUEWSXnmoXKzg5SDoBI2ijpvXjJJi9HrGj55+ge7WHjGVWkUX6pC8YGTP5VwlkthkALUJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZwlvG1ryqCQo63UFXlpK6FlA+hG3xhdL06lmsyhu274q18rng
	CeUaK0JHlWpdlUACU5XZSxGlqTYGYgJzAucvVi1hADj9bBdu7a365o4HOqlgMXYJt8SNLV5ww2o
	chbUvOMoJhUOHaD8aY4y0TdZDuO7ZsoSSjppLMCiELp4uRkcv99AdzCJRWfZ4WVowZAtPnH/abb
	pIVq6QdYrS1oFPDsXoWmhU6Obr1YNe+MdVlLe19arVIta3r6AQCQUvDwg+uBV45dHoq6xZ/hbft
	VKjVnB4DyApiL7Y/fmT5Z0=
X-Gm-Gg: AYBFou2WwDRgjyRQOabeSeeEzv/1dCewhxPtXwb6bXiEIywbI6o8b9R4qRTyC2nhwcp
	f2R9RHAdu7m9V4W8Lp9PTH+s2daodLPEwHzzJdl/w304pq0QrKmnQVtQjzGn5BqnIwD4ojgXu9x
	GyJJPvnoFAkISnsQ0A9ZuHNt5yRdZ95RyAALe23aRtBYF+heO1Juli4xTtVvMvUxlNUS1MPhNsC
	Pp41nmNLWzSWQE/N4Yl4ho0Wlk5CsD3Mxsnl2uy7nrXIW8ZZzmf5UEbUD6HpH0p/QY4xKRQXRqf
	BAus+89mPISVrWMY2R5p7fzuut0wDjJe8audVjn7o8fygSHtugUwSIJSKj4+2PvdddW2RRMlrh9
	/DgoF1KQCgKFUO1WgMgHAlQV6aHfAyi5yE78Ei2PGLAtY10pyU/c8UCVp75V1UPtM
X-Received: by 2002:a17:90b:4c10:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3b1b07ff57fmr4529617a91.5.1794626792619;
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b335bdacsm2979216a91.1.2026.11.13.19.26.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1896313eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626790; x=1795231590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=ZZGSdvwDhuWYni1J2V8Rabf7e46v2yQPOokz9gkSdVbekO/H3ERIoPHTJds7IiXeYS
         uTIrmbycH8wy9wQNFjk+Q7sUh9K30VsbnGrBARn4SeIkZ4V8OzCHTaqG0hWcrmcNNLDR
         Q1o+77GaxgZrNsBq3FM3DXScY+bJ7zXWp6ptI=
X-Forwarded-Encrypted: i=1; AL+hErH5MUl+VJaZGg2ijQEXw7i/6URdgq0XVzS5ztCmpSOfmbPr77WFR+FnhYGfBB9QgzcNhN77KMf+5onjvA==@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626537eec.21.1794626789915;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626503eec.21.1794626789258;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11403804eec.12.2026.11.13.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 09/11] platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
Date: Fri, 13 Nov 2026 19:26:27 -0800
Message-ID: <20261114032627.873858-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:07 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
> bus, where some parameters and statistics are accessed through the MMAL
> layer.
> 
> So add the relevant structures, macros and enum values.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
