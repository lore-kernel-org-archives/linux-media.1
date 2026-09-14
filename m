Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2247884C
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394296; cv=none; b=P3hH9tHkEznMpBbnjkdeMP3cS94eZ3g/qhkGkM47OeV0GlsCgHPQSN3qdlHfXCq66hy4jH+3ACDTpXrYsj2S8eapN5iZ2XGNUd7mhhstj5S/X6YqBc6a+C1OrRjK2fIJ8ItB+9DWKtE2gvnrM5Cu78NAcaAtbKMeubcgLb7t8NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394296; c=relaxed/simple;
	bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvNAYELR09zWYarVJ+7/xXtKYbNHDAFt1PZwbPalstdZV3wxMJkJ3QY/iPP6NyXcAsn6r0T/Kq8VX/Zxq7UZf7c8QtnF8ooWRxoqstDmUvwSN5s6h6utCjePWMZVmIeG7TGn3qIM7wg/9R6FkK5Stvc22bMuAmI7PyVFW8tr+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X8P3lYDS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X8P3lYDS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so14400765e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394292; x=1789999092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
        b=X8P3lYDSSzaevm2qX1w22/Qj8llSLNGT0ciE28hFwo4Ea7X9NGFHZISElv1mddFQgP
         ht8Dv2/nn8tPIStjv852MBfOJthrmrmpTV0FdIakpLTJE64uC6pD3vzGVnMaNbqNpxiS
         cCnUropnrFqIXAlRHnzGbMp+JkIf1BfbbK7bKKNz0M/Y0eT9F2yLuO2ws/z2gDS9T36l
         Z4TIIVJgzHrX6ItmD4w+6KRDAol4BwrphEjLczAENcG8mdEbnqjszBgHDIrO9lJaNXCD
         SucXM6lqTy9nnVYAZI0qUk7SfsnJYXvGPYidTv9MeXDmR/GnaIApIgeHWEI8B8feJPjl
         TGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394292; x=1789999092;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3jgo1bRS058EBMsmbRnIwL+70stlkPOtxZ/EtbSprc=;
        b=aZ4HQ6GzLMkG/qwAsbNQK5u6EjJVPJdtrmcP6u4t8MCWEd9v1vOjmf1BtmB1kWCLl6
         EytmkjDxDaBblJQ06rb70LyYnaMBPURaCDHWeVnTqXDWDXKZGY/Wt37hQDoYKavBrstQ
         UDneHrNTdPEWdzymc/yn0XV2aUeIWTnXcWLRgQryE/P4/Jb5dmRC08CNf0hj4aoGTCOx
         3Cf6uETEGdmTrZcY6DGRIPULv4odNvz1ntbsmtT8Xi5YNcM61m3iXVq9q+Iya6N4dCsK
         KHGzKqEL7MLYviDKz1/BQ44HKfZOw0ITija5/A/pXtpDhdFwtXWaevnA3+VCdV48/bdV
         DItg==
X-Forwarded-Encrypted: i=1; AKwUvBx4TWSQyMhTh2tEcT94OZOSPrbnZSbBh41t8o2n7VC92DxaEBOHS43vCPmgHPx2r+CcfUR+wsWlLDpIIg==@vger.kernel.org
X-Gm-Message-State: AFuF++nfyE7M91ihMLYcvSa9nDimcWgS+GkqMWwEn+M8mSlhDwLOZzwR
	Pn05AIVp38GMH9Fo8X1wPbhCRck+VL/Y9T+paqmUCiCTQHOjEChoU9+p
X-Gm-Gg: AYBFou0/IGF9J2YbfcqLtm6C0eHZM+sFwhAaX0RtW3aU/LggGiYx2iEYyDr38OtxMKE
	kRny0byPHge6TWMpDVDPeDfE6Xyj53mKfc+kV71SaHgsulEHha7qVL5nZBtEHDSxaTepKvQNV97
	ZBk4c0+UiA0hrYOG6JOb7um13Fhz5OjZpHZUR13Ubeiksb3msP4+fem5FpTQwxXgPcj9UuvF5NA
	A+9YuUHzkctDN4c/rr3vwSalnFSfxVTkHEAETjLW//AcHGg4EzvyLoHLfE2MVyUvFVJerHYLktr
	sN3xv5PbTw2DPP8ijdZeSzUNL1YfTwPmd8GSrTp6elnG9VXzuGtThvdMX24fwmTHzCfuqXlhpoW
	FgFrnJowZnNFibucZUVpUzMbS3zlVn3IdwrwVzczNCnli72uESeOqsg/BvnvIk9h58+P20cO2QT
	LlZ5nsVfy7AQSdMdYjIKRnLuv5Iz/SiOQKNC//kbyfSJFPF0HcxFF3obON3Fqoov3WEEcA4cXB0
	DC+mSA=
X-Received: by 2002:a05:600c:4e02:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49e7a6387bcmr83692415e9.2.1789394291560;
        Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e71e300f3sm225487395e9.7.2026.09.14.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:58:11 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Pierre Pinon <pierre@pinon1.fr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ov08x40: implement get_selection
Date: Mon, 14 Sep 2026 15:58:02 +0200
Message-ID: <178939428219.2527.444869479328128548@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130803.2632-1-okerixx@gmail.com>
References: <20260908130803.2632-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 03:08:03PM +0200, Oleg Keri wrote:
> Report the full pixel array and the per-mode analogue crop.

Please drop this one. Pierre Pinon posted the same change four days
earlier [1], with identical rectangles, and I missed it before sending.
I will follow up there instead.

[1] https://lore.kernel.org/linux-media/20260904134524.595598-1-pierre@pinon1.fr/

Thanks,
Oleg
