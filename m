Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626813;
	b=U9ujvLOUmEqR2wmiYCn7SycpdxTQ0qKa+zXVAUgOAqgXqQ3mAyeI4DvNOVAhn8e/9Eg3
	 d9yhReqrj/wBto1cKkMHKUNzH41KvKdX7fQ0emGFVsZFc1V7gu+D6+CHou1hIav1dojDV
	 ZqW1QaVBdr5AxER9NailmUlq58HxsNZxT5w8LMw2bUNBhqhoaMkhyDTJ5AkrKnTWjhdp+
	 QvGF7vWxFP9FdToHH9GxaIu+gq9F0vr5aoc+R/zxwZ9mkyeMj6VtGGZH+q6jaz8IDRLZW
	 kSrb9P6p3h08lKmdLk1xHp2wxH9i7w6hpN1Ngifd1fmWphBIBuITN7zhx4Tltpehc9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626813;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
	b=SQI+WHwMjTL02UIVTWY3rHePeXRCJafVZvzIye6ROxWAc2dDdUh3ftxLzqVJuUy8sPkm
	 k5YGiSYWjilI2FR2wJrHCpinUfS1/4LtNed9SdTmnOfikRLPGRuZuFZtqy88uTV7VlAxJ
	 OCjej9XYvFGNy6SXmjK7NbJzefBQIu+r79YsOysDSHYs+BmS92HL8W6TqD5rZL1WL/21t
	 +dNzmb/jGSmbHIZifnxSMoFI1SfEif9fyy3BEBS5M137J3j31kolmtxdEZqiraDPdIOSw
	 PCGwMkSTto7sTndrGLWMBfr5BQHVD4o1Nu3qrZlC4MU6lRU00QWg7AV0n9V8wd4u53A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UxAEkOml;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23628606A332
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23628606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UxAEkOml
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1349263a91.2
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626810; x=1795231610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=UI9zVUSy1g7eDakqWaCoirAzXkMvvP8T6xQUlzYQ8PZZL+xwYXOhMCCTBpHZWsFzCs
         HgNYhLxCQtY0LzsIklbD23uGFeNSFfPRMKPA0zrSysdABh8ZejA44TL9GvCJwzWDIy2J
         ePUscSlTvyWEOc7M/V1As5RxW33cvT2uW45+BAqwIl/UqH+kwgt7cA4Y5OGg89pPI7B6
         Tz/5eLgzU75vWOg5hARvS6Abc4xzG2gRqUJ4CFCSialI6Bb7dYYm/MfTOMcjxzpGtAKG
         0yoIVRW37gV80DyceZDOyym+o9mpIJUcFi+WHSazOOy1H+NRGhnhaKVvXWAoprf/prZM
         SkoQ==
X-Forwarded-Encrypted: i=1; AL+hErEKeAph1MYaohROONKMKTgrXCAjnDbWAV71TT8OII2lniCV5/Gk8Bwbjkt/VB8XWusLgfcwOmw5vxFP9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+nPkAZbT5bZKdYWuXWEPTFFpXtKT4IskwYKnofDhmQlIWhvbnr
	qb9NldVw1otd9yko68ZtdYwGjzTL1pc4yeVHR5D9e+BQXb2X9xNTCJUpTSr30XI90DH4t3t0PnQ
	wWpDYP+15dbLP7Iycp5/hqbX0j7cCzXtFJV/yumRKpRaa2TCWRYNvDVP16uvoJ/o87qeZGnDYoj
	Po8S76TWh4EAAioYF5+UCI/tjeLp0e4qhsf2mkQgYRtOtH5U7v7KnnRFxpXJA0DSqnBdWv3X/tN
	bFyLbLhIFHmrB7fpAjWcCM=
X-Gm-Gg: AYBFou07+RYLcv1FPMf5V5yW8cuPZf4M8yme/Z8rXrZqZhUi1kGabRqdNuf1NNMWA9g
	5vztxi6BC3DCfQAUAQQTado5URz8tvU9P7nivi8x+pO2yiSekG/GPevFZYUakmhg49HkkTs4OBL
	QrkuwG1p/aL7bYg4VNRQdAgfdk/ITS7YYKQYHKAWsH1xtQl1NQkGkwgNV5eXge1ZvKFDyPusv9Z
	ZnRFBUqVi5j7w4bKi5SESp6Yisx0nigBgBaVJd0vZS1g8QGvnAwVEGA07s6NDy5bEhgY/g9xFFC
	aXI9ed27tSpZPKQt20vJ+IlFTy0aTfHZCzo/XnjVS9htzdiOGo1tdIjoubD1JkC6EzWzPWWAbh4
	4cLU5P91uqiSV0cOuo5TH0ncDla3D1OwwoPWfsCb+FRzLVtvWpFKWC8YZza3XZkBT
X-Received: by 2002:a17:90b:4d0b:b0:3ac:a7ee:678c with SMTP id 98e67ed59e1d1-3b1b07e41aemr4215528a91.2.1794626810389;
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdf4dbsm9217382a91.8.2026.11.13.19.26.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso1360851a91.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626807; x=1795231607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Df9Xd9VZHrZ3bx0rqok9KRd1CcHGH7mE8EOxZfY9S/w=;
        b=UxAEkOmlkK4g9YTLxY/6oydRvzAIgoLe6AyhloyeeqeHAwlwj/iFpI2XWMSrsoCrGz
         iLgOTGIeb/tB+4IeMtvN0jz+NO238cP8ypglHaMUV9qzsbCQuPXdR6K/cLp2O4ATNzgw
         5/Yrm3zSVFZktuI3vjnfSnEqqwiEfQIOUe8Pw=
X-Forwarded-Encrypted: i=1; AL+hErEkTwBMZ5O2CvMN2YM3XpTMcE5IQaKN7JbCFaN/z+wX1pU5aJ6KsIqmFcWgQe1uMMac+78eJK+pmp9fLA==@vger.kernel.org
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739862a91.52.1794626807451;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b1b0b85d23mr3739840a91.52.1794626807045;
        Fri, 13 Nov 2026 19:26:47 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc188ff97sm2060162a12.16.2026.11.13.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:45 -0800 (PST)
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
	Paul Elder <paul.elder@ideasonboard.com>,
	Umang Jain <uajain@igalia.com>
Subject: Re: [PATCH v5 11/11] platform/raspberrypi: vchiq: Add helpers for vchiq driver data
Date: Fri, 13 Nov 2026 19:26:44 -0800
Message-ID: <20261114032644.874052-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-11-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:09 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
> vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
> respectively.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
