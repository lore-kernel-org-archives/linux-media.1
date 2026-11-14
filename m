Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626772;
	b=yt1h7RNUAsGUfmxmfWrDbd32iANBXqWHFPM1SxXnTkugdippmsoeH1Ru0JNV4TFRxzQW
	 WZ9shs1P16bAZx33LvVyIRNIpDYwij/sSZvpXxs/XGfVgELNpoDbBEARrg5cWhzVEnS8+
	 FoAj2Hag0/w+mA4qorAzMGSfSRMPUjjsJ0PSiUzqbMBTdxbh2TpViyvCSzPcV64IFTzrO
	 uGIKNvatmPTgHApy5s7VQG9ZJEiX5bByEmLtcweP59nZ7mn4FDsLWhL17bqlqCfbOPw4C
	 QhvP3zWPYRaMvQAQ9XMlxwdKiNXyMd2UWx1QC1jMHXl3+G8nVX70crBb1fbKmJQDCrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626772;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
	b=pZnQUY4U4rdQyVJC2c0Etr1UEn1lGtHDoKYP2x1QmA74WmijzHFCc5/QPNAxEtLsnMeK
	 61SWDxRV+33p+j1HgZt3YVUlaa8GO4SMT9dO2QSJ1BmeZLYCcZrxP3h3ov8SPNb6jJtb/
	 O3TW3D2nU5X9dPrZJp6vc1goEIiS2uGhefSBb/kXerO1EIWbLS/9pxviOs5UvPLaaSjZl
	 wsUCS0gWN6PiCqQsnxEL1MRVxEgc/Gf9CUJv1VKnBBTP6g+vtKQnjakrOAkzn9u1Uz+Dv
	 h/ucRfQTJDT3kxrlTXrj+JyoKC8w3JcJFWryQp1i5AJFrstXmAc7vDNxqg6H0FvPgDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="IKl2t/1w";
	arc=none smtp.remote-ip=209.85.214.226
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6056D606A886
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6056D606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IKl2t/1w
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2ede7cb02daso19436185ad.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626772; x=1795231572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=GCpTjNkyL/I5VRgCfwqZ3urr3FjFpVk0hJMIwk4nW4TNLQHyKj6bheMiTiJLQWQn5A
         uiVOkEKOjqIXeGIvNw6i1HZ5nE3v8Vk4QEC2PRqKDlbut3gx2mpEl0w880K3o9NyKOxS
         MND4BlJLlCQYx5UvzuuwZzc57n7fi3ae3A8Q8ffAHEj8b4RLvyiFku70DmG7imAQXdk0
         4cR3Y9BIYll4/2x6DriOsRGjWUF3Az2UviPikCril3Pan01O5K9w/L2g3fmhN/+TMFxW
         QdEQfyQv6FXo86hDQPFMI5fTVojBWaZJybdX1xCFUGeLx45DWpmWOo8ahXy2ROiFUvwC
         xJJw==
X-Forwarded-Encrypted: i=1; AL+hErHvkvyVMEef88D0CWZlBVU6lwU/vXj2sPexeLSN9BKb421hjjv0LNvfpCJ17ocD1CsZCqUwSqSYcXxKnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ISHkreQHa7FbZ5WHtv7e3x+mSEEaUEOgmLP7d5CSDDd4b29iC
	ItklAaqcuuWEkGv8WOhFM9P9hiMMKcls3NhNmSnFFTDG4UIMZvwVrWimdD6wDzfy7W+LikmpFsn
	HN7WRhAWUlgZQ+RJPmeGLf7lYdCMJqWQCGM1UL+fRVzZEFHo/h0upEEdFkxNP1p5r6khRbOyMuM
	o0NSDYeXR7Fv25sWtY4l4a5OdkDkzEl3A1l0alcJV9CZi42p7gjm1KRZSt2+hVCd4YiWEkPCqnn
	JpA0vrWo4UE7oHcH5p9XzQ=
X-Gm-Gg: AYBFou12BM2zh91/9mFYmmf14kySkd/7ygogeVSnSnAVoYRv5chPFNkDaeV5/5rlsLv
	gIAIYXqCjihx4rfD6NIaHwypUO+t/rjvxM6q6vIMrRKD44Hia73KRMOCGR0sGIIaf5e5opBzz04
	Z9xbwp2sjkCVeiJust7GvFYAEyVjM0kEmQPz2cS/a5qE4ypGwZadIdgIckmrD6u56DFVVPA37Gx
	qi0GKDBZz9uwVy+UzCjn1Vwf9KRECiaVYq1auM3oLW946ch/EkWG5C7fAg5NogiPt4PGV8E1pBN
	p7WmOi8mQyArVgINpFSz/v+K7f2ZSkAwGxiLj6qB1N/V6FmlOGNUBpDPi+SZMS78Q6RrNzx7Ayq
	23Z+t/OyjSoT0ABE8TRwZjofkd4vnUBvmWW790D74PCiMIRZfWtcCmx4C1nBSznGMZhI1SeXgKY
	K38vXA6wtYAT6YqHHKr+zFlgJN0Z7MpMkioJDV2hwl
X-Received: by 2002:a17:90b:2d44:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3b1b0b5c014mr2950859a91.10.1794626771760;
        Fri, 13 Nov 2026 19:26:11 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197ca0af1sm8857733a91.3.2026.11.13.19.26.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:11 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3724667bc16so1003970eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626769; x=1795231569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf+u8uDdBeb8sz6+AsPwZUYSErJxQM3b+PCxFlU5aJc=;
        b=IKl2t/1wPrVguI+AFWbv4UiiX5YKtcwOJexuVTsNpPOzelgDZNAj5JcvuG84UK4P3X
         IKxkaTdb6IN8vfoia3qIM8s4K89aYNDE6crLz2o4lRdCjT6vwFmd898tN0iZeQElZPwV
         RUlWt3uKx7/TnynIOV+phF0YqH7OUgvMWahTI=
X-Forwarded-Encrypted: i=1; AL+hErE/Cde1l9Mqmc9ntLPRavmND+IPZNGcZYaGizEe9heyEdSPaaqgtKpCKCuvmfEdbJEL130K9OGT8bzPdQ==@vger.kernel.org
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7061013c88.0.1794626768614;
        Fri, 13 Nov 2026 19:26:08 -0800 (PST)
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr7060975c88.0.1794626767910;
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm14219770eec.27.2026.11.13.19.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:07 -0800 (PST)
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
Subject: Re: [PATCH v5 07/11] platform/raspberrypi: vchiq-mmal: Include missing headers
Date: Fri, 13 Nov 2026 19:26:05 -0800
Message-ID: <20261114032606.873673-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-7-d25e3b687e71@ideasonboard.com>
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

On Thu, 12 Nov 2026 16:48:05 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The structures defined in mmal-common.h use types related to lists and
> videobuf2 framework, but are missing the explicit includes for them.
> Include those.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian
