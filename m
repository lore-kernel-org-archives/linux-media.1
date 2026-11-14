Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626780;
	b=j2F+Ygj64uKLkylB0X3oEoPZQDuyVLk8IkFunqrIx9tic4fOWpoGJJ3h/wjD6fA4UrqU
	 7T7zNQYh+4LVA+9TNKbwByto3UPM8439GtLeWWkA5bKg4WVuZGcPVWfzzw6dZLZzraFbv
	 xIEose23cLa0Lux0yst/LOjfNYEPjfiS7TJr99Nd+CPTAk2tdewDDofwR/NjU2YsOOBDg
	 T8Bb5Lpnduo0QFyMrzAjxDqG8Bhe2TWheHtPCcB2jd0MicnQLUTsssoFIptDzSV7lIBIB
	 il6XsCatIq5EoAWBselmZ2y0rqOeSw+n80hAixhvXulgEUjWjll7msOp4rn7InSLkdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626780;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
	b=qQvvp+7umMaHnBq6LsE1k+eWXv9agPn3uJjFZxcI5/Fx/R/V1UZcNO9YLL0YGJZQG2KD
	 qe1fKWJHjolkJJWOdxAym34dLtT+UF6LOIyhscH9ZCCJlNn4jWuLQ2m3rb6UmSsRnXBV5
	 4PQQyuBBsPVzye1ntvcYViLxP7kzWweDh6zZh8n4CXy/duCk3kwrcd6HbsHNDaeVfPmeV
	 HP088Wg7t96Yo3UtK/a/wVRxUdo3rTnEHNvd19sejGQ47LKPydh8Mfu+YB8Da35/AgmBi
	 Pp14yVZIAKzg4KkqjwKy4kCTzozAMKjQB7KUHy19CaylNOG69CpOdkrDmg71HNftnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEiDPlUr;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B9606A896
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6B9606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEiDPlUr
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso853392a91.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626779; x=1795231579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=Cfm0tIWm+M833nmtLCDdYh+TmQiUGwt+ctnlqrllBOR2bzH7uzieWBHnJpRwCHabZ3
         m9XHeohDcJs6opMKJEwy4JYecPMjEb1URZWWdM5QLaLl827yCguL8Ebdl8Bnuc64d48z
         0F1UxqIND8g+9aCa1xoGdeOp7sy0wfybbAfmQdiYNrF5xhaFOnFDi1xPbjF7ypsdIsK7
         47aVkvXmXeLK53vFQ7PIRcr2xvCvz8RRRd6hPqcjI0Qc6MLjtbd5GE/jtJOafNdXbHhW
         UrRJrTumdx2bjRG03hw1Kgz5XabEFRgVAzkv9UTrBDNN259GvzfGtIiiSbNA3SUzJ4+Y
         qwgg==
X-Forwarded-Encrypted: i=1; AL+hErHtlCXvgtMyG590z2d/mb4CCdppAKTvlNZR9FZoRMQVgGgdGWksk6ueu6Z8Ha2gP+R7odcAAC191OC4lw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KGX6SX6LykksHE5EF4uaqlN3GMJOSAssyijl66nqAuGpTRa7A
	AV5GoxVlnobFIU6NuuaZpSKcDRt7FajxiRWj2YHj2mD8FUKOmyZxvNGNyeuykOQBlcahyQ6znmF
	4B12Qkko3k/jlrDAMXWlnlZzWrBe0TTdxKwoVq+XRGbO49UPK3n3YvnMvxnCq2AeRm3GYJIwBP0
	GjynaBVYzoK4BXSqUDwEgYctnwCHJEcY97AkEybmsAKy3ZnTnKcGg1tXyNWItEwTbZT9DJZ2bnm
	7L/FayvoT7OSAIwzLc4Zps=
X-Gm-Gg: AYBFou1S/El0E/omXmVv5SrDZMhuxidY3jU8K/9/uaHUlstU7vyOdyfshgXTvbUxGqz
	3975Ag0ccJVHM30H1zv8mQEB/id5E31E/xIpep2egb5Zylad6iAyHxKruLIqY5PxnnT/5KYi0rs
	zodCwvgKRNC5FTBAv+Y/12DrnncnP7j09evLF11suzHIcsAzTN2kbzraWZMhqBzVdeXkAbjhDRM
	6tqIharxMF3A5ZnFqOKYtvfv6uYtEPHDsJjIP46zIB5NL2dgvFcs4wtBfTrb4O7mTGvZ1FPu8Ml
	HYmwANCv+z8LYXC7/qpsvvg1rveDypkDKpnhIdXWOXRimrZPgiGFbQ9L3OBieD2oXtmJeH8URPb
	Xlf8WtZiYyqjTFNBmNUtduxcuq/d/+xX5PCFjCWWOzt4S2Q/hyrtyV4uLpUS21h2fm7exn1/u9/
	VtCg9RYB2ZZw9dnH3crwpt97uCliaYk+1HWMy2fSXe
X-Received: by 2002:a17:90b:3890:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b1b0a4c362mr3797998a91.32.1794626779236;
        Fri, 13 Nov 2026 19:26:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b19db1fd6csm8533725a91.1.2026.11.13.19.26.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1896227eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626778; x=1795231578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhRZX/7e51oyabbxdjdkBY4WBe9PwD1txTeNO1MwifA=;
        b=NEiDPlUrW5CXC+wl3oI1nbnz0QDGSTKwZemkNoH47Cr6+piZAwSMF5IY2+gAw24u16
         n9P8gaFPbAW4BLDwZqVIf3+fGXfdOXkMQ/maBGh7HgrUXveAWI3M7MTvetKMeGm+HDcr
         i7Ubd6PZ9/H8uekjiClLJuW8Ejr6VRdrjDj2c=
X-Forwarded-Encrypted: i=1; AL+hErHI9J1MgFk7Cxu+v8+zE9jcfB97hsxiIAVbBucERylJnlMlHtezGKohqxw4eYJXitfIjSf7REw3OqTcuQ==@vger.kernel.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626102eec.21.1794626777545;
        Fri, 13 Nov 2026 19:26:17 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626066eec.21.1794626776854;
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm11863608eec.0.2026.11.13.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:16 -0800 (PST)
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
Subject: Re: [PATCH v5 08/11] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
Date: Fri, 13 Nov 2026 19:26:14 -0800
Message-ID: <20261114032614.873772-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-8-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:06 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Now that VCHIQ interface is destaged, different drivers (like ISP or
> codec) no longer live under the same tree as VCHIQ-MMAL, but in their
> relevant trees like media or audio.
> 
> Enable access to the MMAL headers for such drivers by moving them under
> include/linux/raspberrypi with other VCHIQ headers.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
