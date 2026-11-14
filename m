Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626759;
	b=I0lscLrp68Mxj2fGY5Yp/191ly/aSkVMG33xWARPba6jZv0nh0atz21p9rDCQAHcohZ2
	 sGNv/a8J8RuRSTj2etqZNZT6UDrNjdARbDdQ7NnJ5IkyEa/WeMg8Ky0Ky+9KiEsUudTwy
	 zYnMYP9GfU43MGck9Z82OLdwlE5frR5e3gjs0+CYY2JSoPL31Qi/r9vs1RkplR45H/xcb
	 q5+idEqi3zu7IRfOd+TG1nare9JmBjQtxsAjT0CaxQObcaTynS8hkAXJ90uRJolCGA8ap
	 a/1X3vHXI33mhPoXBAbZ4bRjXff38mQV/c/pqijVa8b42Y/kGAWZI5r+l5m/zxh+IXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626759;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
	b=tTrE1TnkgOsyhdsh80S2pH0VEClzupadAUpe7ilLQ3vLmVdB+8n7FK/n5irMEHMZTV9E
	 nOWd9mG2ClQTThs6oBmd7hmbLHlJKvo3XXUSN+mS2KxGlJovSW3NBVAYyr1pSXyc94HaD
	 r0xwA12POt/F762yYJskNXaLi/epxykD1HdUNJwRgNxw33+ZpDjiGNmkh5T0pGw79nO21
	 kqXj9P9m4jAcQql2d19M5O2Qo/1BPSVBiVygX62Ss+mkgY4zqlBwSDZvt8PhItR6HCbpy
	 bpD6CXJrVYTy5HbleTSoqbZ4jW1lkjjKIxaw+6T8ke48UZoU1PrRwfdMYjquOxeKung==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ILSCDYAI;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26140606A323
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26140606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ILSCDYAI
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso2283053a91.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626758; x=1795231558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=gRwhgqgcb/qt9xeOFTaTyArQI2vAO+iWShSOVfD6FOifNurZF3AzZAgU/1Tsi3W+KJ
         fXlHzH3TSomDOA7VXaTlmzSZZWRVhpEo7BjZ+FUWVww7Edi0KqBf8yGhZSgAcz2BFKwI
         1dB45226nOiTGxHD58C4pSnFjYfFlHkYhSaDekpq/3e0WHfLHjOUrARJFiKNk+h0VHm8
         bb6MwGpqLxgBB6HauIKgOxZwia75C+rgsy7iKhUmFuQSpNv87C+Z5Qs+rGMvJFHLwCov
         qYD7x9gE0ojk9xAWe+v6O9ZMZcjaDYD3k0DdpW3cWq54xGHZBCUcRC1CPej3zz8F7zKA
         VYqA==
X-Forwarded-Encrypted: i=1; AL+hErGtJvvVDz3rfWnCRdSX0MbkTPX7eNN7SIcQpSi5p1OxKolLZbPd6nQqgfV16o7aJMYMNkfNR1DHxW9o1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z+21YfOFX9I9ubSTvVbcekXtaTHajnVK9nyT9XWLQKTRWJQqXAg
	QrlQPXZIKDooH9e+r15Ikm5qoAO5E/ZQ9vl/cCMA0KNfv66axuIvFoiCdyDSkJpXUQRPByX5/MQ
	F1MtcfvcBBkcPB8iSyiRIKC6C43orfmQjR3VXR2q2zGyRBUS4s0/7z7DJCMl7UIuBcSrUxfdji2
	JjcthMmFNePAeXFEenHzVyz7WqewLv82u95U+vM0JTjEdb73guk4qE6dRIFqOSxVAg2/sOZyyhQ
	dF5yJ01HBLwlS/6xMCho3k=
X-Gm-Gg: AYBFou2wWdijKfkd+JeErcJMENHafLX0MyoSvHyAB+mRbFnec9ZThXnS+ZCYkl4Ppsr
	7NbEO3OXXp5s/kEmc5vAs4ZshdmDfF9evZMBDUDcTEZ2Io1Yb5zbtcgxWzED9HT51PtIHeuI4pQ
	OOPkL5j40558A7AqGEgY7ongRPvpxXoJkGgJdhpcVprWQ65MG7eqBWi1US4XRj6sC4deU3Id8Mh
	Cy28uvaCWL+bvzr5CwEaAV4TsAnMxN+tG/H38+K4BkKTX9txE1t8Ge/Ozfle/9h8m6cM/Db0eq0
	AtRCXpAAUfEtxX1D3+Z+2qqyBh2PFx2jdJmb3FL7au4D9rorb5Fynso0hHDOsx4AsV0k3WlAU4q
	tJv+Jt/bkIR6iPkZ77itvbt3TKP4bc0a794kqlloJpoYF+3+q2tPZ9eUq5Mj3NwFh7F1KDiU6yB
	KUqQunfTBw2dVNYAW41Zbata2xzC6kZIjHe4N/lSCA
X-Received: by 2002:a17:90b:3909:b0:3ad:adfe:5854 with SMTP id 98e67ed59e1d1-3b1b0cac9b1mr3970513a91.40.1794626758478;
        Fri, 13 Nov 2026 19:25:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1c4bcf708sm871544a91.3.2026.11.13.19.25.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:25:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7001843eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626755; x=1795231555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFJw/xnt2UTIRXJ0b6cAPbUEvo6Sxa3vSGm5EiU5G8w=;
        b=ILSCDYAI0D7c7PrrUSpkWaR62tqFOIQW+e5Zzk8wL4foD7ST4HnJ1Jp86AqvHpVaVi
         jg8o/SwCPe+4B3U0WDT7ZS0/k261w9oXFTdllRcXgyQJDe/O3jwf6yG5LO3mWnT++MBf
         gZUJbL8xiLsTnEFVF5golJhAtMaD78SUolqmo=
X-Forwarded-Encrypted: i=1; AL+hErFib8jsodkH09f+XQVALZQqT3Ql1tYAbwcd5eWrEdQOGhc6YN3ai3QSW/Xld2qtLSE7lrCBZuQJX7n63A==@vger.kernel.org
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249929eec.41.1794626755311;
        Fri, 13 Nov 2026 19:25:55 -0800 (PST)
X-Received: by 2002:a05:7301:d819:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-379681c73a9mr4249896eec.41.1794626754618;
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d73dsm12221650eec.2.2026.11.13.19.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:25:54 -0800 (PST)
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
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 06/11] platform/raspberrypi: vchiq: Register vc-sm-cma as a platform driver
Date: Fri, 13 Nov 2026 19:25:52 -0800
Message-ID: <20261114032552.873583-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-6-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:04 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> Register the vc-sm-cma driver as a platform driver under vchiq.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
