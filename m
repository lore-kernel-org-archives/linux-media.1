Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626801;
	b=qrE4T9rLkohxN8bRAjgLgZPNGrAH0PeAgy7SZ4uVj+D+TS9UCqOSgbMMbwwmaVWjhLrS
	 xqyGeHbiJrmS5fSpcvUQ4wkx6yxLFS0h4TMR4orP0qpg0oB3qXqVL0mEO+QqTct/3Lxji
	 ptjlXydRuL2Wf1BFRus2wDi7fn+/eWxwIQyaNO7SkweZtpBtRRU60JEqZ4mJol53fAbjM
	 T4skdMRcmGSbec/UYQl2qhwAUZvw4TU3/IMJUCuOwsIjAuLeBBiWoaZSUN5pkojciFBjK
	 HqIysc/PnRR8YtMcilhYn736B9jcY2ErbVFFhO8gTCWPzUKlnM0MRQhW7hK7jopHlFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626801;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
	b=VJsuAPuzfUdePwgoU+mTf69nzXSr6eqVwPrmdlzpDJQYvi/UFSByMkcoBFykL0fAdWjc
	 +eM/7OMn+6gJgWHRVQjmZZsvNyukFu+kM2JMUkhMelwGOlbK4QDKSpl0D9KBBStjhcMda
	 DAEPwVvGpe2FzHgTQxcVce6FY7v9GFK/dBpQVafpU2b3QzJtBfxNyTyRUtw4r8SVdcuQ+
	 on44wFPdEFYhrCOsenFtj/blJaVKn3rSFgd+coIxhsqCzPr1Xks9+MyNVXiWDZ75zAtGd
	 753FB/9h4CL7y15AZCgCV73zvddeasNMyWBRnO0pvgkbyIKOtJJCgDjGvfMJzvHktlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vsf5TbpD;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697E9606A88C
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 697E9606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vsf5TbpD
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so799729a12.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626801; x=1795231601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=Ku+He70hGa5uLsJ0Jkn/0qzVu1TB/ovGJMUCnwRKVGNwjoUexN+vwqxE4xVAr/MIW8
         bpn+MAqMILnbtUC7BRj8sp0FfHnZZ7FVT2gWRRaN6qZlcthOZPYupywNNM3PTEGRDe9f
         1H37H/jPtTwdtlwyauIkHL/q1B27pVB2UeHUcGJlJ43RaS+K6rseL6HjEemgV+36rQHJ
         qqFa+o+R+4vvPkmCFfpqf3cK+Iw2Me+wc373mlNtGUdM+4dkDbI83R1087Pf1VfcqPVf
         72qGpGLtQ3zIAKqc8XliFxOP+VrpMACNk4aWEmFSinSWYT5y9PiIRrouw2C26Ke475oQ
         /MYQ==
X-Forwarded-Encrypted: i=1; AL+hErHuQztYucb86uoHNYWS38VTVQe1Yy0KZl0Ie5fqLa+J1acemfheup9S4qcB73cgE6uoSW8fyTTDXCysOg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8uxnCDrA7NPa4OmFTurOwvJClVWlGLlDG9+Gi1PqglJggKxExF
	VGPQu7BSzk+EaxTp02H3keb6XHgLl+2TpBiV6pzH1yd+P9AxckdrepVcc5JirR3WIQhB4s+D3O2
	bhgvQsJ5I3B8Wwynh5huCwo6nw5CzZaPq3nWbH7XOU+vrIpNMVTtsQYDAw6mJy+Pjyvn3HZ7aUe
	NLdrKTQ8Kl0vv56F3u+AT6PuPkPR60T5cgk2ndd+f+dAkg2/NWmGX43/Xq9BWjNTk5mtDPzLsXT
	4PjRPZKUyC8TsgmyhlMttk=
X-Gm-Gg: AYBFou0tGgN7iWYIdZ02+UTDqzumlWxDMvxJcLsObKDPv3wcuXUKMMvtRdRLqV7lGWx
	YVy/bMwe8qi+XQQDlGf24aHXJFLtwXe29nUYfljomRhDPlQNGQbGxqUYeCrBJ3Nj+yD/xMrMv5s
	iNsBfSSgRZy+oxvvcxoYC5y8YakAAa4mI513Fveso+JC0sIliwekZGwgqrgYDRZ8hzR2mT/8RkM
	cq1PafGQ4aSkU9IOd8hEcMO+NqVONFN2ojaztK/pMJJptF3VOjZNKZuYrGiWHpYcUNR/L8owuPW
	HufDPLBcWv+H6PurLl9clW3JXizYF28WPUYJ2SrKADzdDCB1dwgnkzkPAmpiF4A7a/y6XN8Iyk6
	gEkb0nSwFaTEtEXV6Edj7zGx1yga2QsMRAxG4wTSlxli5ucfAn7U1eUTyXfz3JUjA9bKxF5y+Po
	pbZABTJW/hdj/jmAWy04pzgKCh7OMO3W3lt1EkZwTX4YY=
X-Received: by 2002:a17:90a:c88b:b0:39e:21a7:5df5 with SMTP id 98e67ed59e1d1-3b1b0a3e44emr4429832a91.24.1794626800662;
        Fri, 13 Nov 2026 19:26:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3abbe1asm3283500a91.5.2026.11.13.19.26.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so1896365eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626799; x=1795231599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4b6Up4gAM70Cuwx/Xvys8/hZil2sANohA08sIDRsk88=;
        b=Vsf5TbpDQ0HT4c5Y6uCG/OtNbZ+FvTFce7INMMkNxG+Gz0ZJ7RjHklyTghNe5Wy0gY
         4+TV9+tV3hPkRV+Z05Ge28qcgD2oG8PbTJBgVVEE4oZ5ZJ02wOoybKY6Ln/7uDlo8jEt
         b6f+UNApLD8EwVaQGZsMxMBTqMigujknpIxkk=
X-Forwarded-Encrypted: i=1; AL+hErHPv4q6QzAirsSD73D3V0yyeHJ36XXZk+H5LB8Xle2yvpr0WldxpzhXlIivC+dKzcAeCK58+uYmQofBig==@vger.kernel.org
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925405eec.2.1794626798690;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr5925349eec.2.1794626798003;
        Fri, 13 Nov 2026 19:26:38 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm12182371eec.7.2026.11.13.19.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:37 -0800 (PST)
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
Subject: Re: [PATCH v5 10/11] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
Date: Fri, 13 Nov 2026 19:26:36 -0800
Message-ID: <20261114032636.873947-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-10-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:08 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Raw camera sensors often send data as packed or unpacked bayer and gray
> formats, which needs to be processed by the ISP.
> 
> Add macros to support bayer and gray format FOURCCs in the MMAL layer.
> 
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
