Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA6C47D447
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932707; cv=none; b=Zk9LqbAJNwHsvC9b5u8CUn0TGgreakVUSximQBMqWNhNPPK32xQy3lyBXPQxmGGSIDMphU6J6xrC4LpwhiShU2Y9VH/vWxstABi/GJ4peAfi+LNZNvaTfCtNVvVt1P0hmhu4n5LUbMnwbTlvkR1bAJVwCsQObGHVA9ZvCWC7l3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932707; c=relaxed/simple;
	bh=puMJQvXevs3HfhMHL2nYeCos2nWEYd1yPhYmpj4JZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S1ahhVgH7a/R3lYbvD62MZ9zcxNokGGokowBym0HN7kMwrRu8VwX8agXRbzcRvBRMFrBNAn0niHEyISgMzXeQyq5mNxCDUn1zEkFBiVvz25hB6B534qTy+WlTrPv7i03proe5Php1OHpPpFTHUWmmmpAoePfs4Z+a5gQV2jirzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrXBTwPH; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrXBTwPH"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso46990245e9.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932704; x=1791537504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=GrXBTwPHLCMR7QVj3hxHMlechmLfcD3JABh1CpXMfV4rvSMMAUfXVxpI5e0k3T/p7Y
         R1Idb3y66wK9RGMztSekgsobz2mO3UFlyIiwOUPwGHxB9VTQxVPJ/NMRJO6JFjCo2AHb
         O9qwdaU5JrTXZ3imo9S+D1bi9WNOZilWJn8PXmQWuV8CJPCrx+/jxqtDMgIp1KoCjs80
         uImPabqQewK9SsHC1iqdsnK6KuiC8qo816AF08oNJY/D/SN+nfY8jLViRpu11CjQdV5A
         A9KowZMEunvf+hPyan7qkmC+IPFVoBpXqIq91M1kVEEfD0grdZjpAhV/EDQjlX+DIRJe
         qDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932704; x=1791537504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRXlY/+4LCQNl/VbKdPpV5Ly6hs12yT1nCaZQ3FsDE8=;
        b=nSrFP7rSSLCfxoaN7nyhkFz0hC91nFCAl7ntsABiP0id/LM7xv6QuaxZjc0y9adfHa
         yXuRTSLsLYTJxTrpQjBkgZr6Xqr/6l7wE/R67KrZyNgshPMXVdI+LDQBi3S7BR2oUBmY
         k5Ptvg4zuWS6mwgoTOSMDeMozZ4ggw4PDb3LlmJBFmFTWRLcUCbNKH4PJfNJa2SB8jwT
         Mjg3L6pnnWAh0JxJEW6jb1DwjpVhxYCgSVYvHGAFjXVi1Pq3ak0IECmHSED24UHB++pX
         1UF6ndhwyvYbm1EGlRN+sjuU0tBmWBoowNn/MfPO9gWELEpJ9Sm6/ix8e4mRq0uz1UHf
         YcWg==
X-Forwarded-Encrypted: i=1; AKwUvBx/1DTkviRY6+Lg7Uc5PXGX7tvH8GnpbUhO0Ta7zZt6EPGXoWiwnn70WxWvaZFQsN7lSeLCJMCni9OoRw==@vger.kernel.org
X-Gm-Message-State: AFuF++lyERtwBV+LqFltUvLYvYhqleT9PcFF5PRQg7LP+KGEUCS3dYqq
	ZHWO4UaG1N9m+vfIVV5q9g73EYUNDlfjL547u+Sj7O74ePhhWiriBaSi
X-Gm-Gg: AYBFou3xE94ptn470zNGbejslnGJ7WRGnGjZFUbD8DHwKjtG04yslaDEhov/54Ewky8
	Xop+2Fda0TwzQ68LDVTYmagW42QVia0sFi9Kk+NmXZwUBZJRb6sVReDgEruZB1Y5MasLnZoejIn
	lLkDbzvyf1kUpAqxj3oht0d84NmxDORaIKOFUlqr7uFtU6NqgmudCq8mJF87XZSKi3e04YApcvz
	VhtCJ1T+9bStghZDK+gA3ZQ/h1NnEdZ/5Qw4clBYgnfREQBHc44tGQ7KuFz5N8mB+SelUyW9uut
	Fq441Pf28k7KqMHqBQ2/K4HqyGMchUPoQcU2BUvykEMur8Jh98sMeO3AzHnm0qZWbZ5d3u60L5/
	SoUFQmBI1vyvWX/rRFWJEN8+9GYOdlq6pbDUNcwbB9aPrTEr954bn+xNT9qiBaP5QwlfnOI4Okt
	NUFJBADTvRickUSnobpMkhrtJIfPrcacXWD5tqcHVV7gsZRxok/UqW9CWaroj7yOjXoF0KsEykE
	YEKMx3cyopXwxFZ0yIQHG2CvmNm2RIpq2to5yApWv08EpAVKkFqisQ67qc=
X-Received: by 2002:a05:600c:6a04:b0:4a0:4f6:3dc5 with SMTP id 5b1f17b1804b1-4a027542255mr25781515e9.7.1790932703704;
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
Received: from 1Z10 ([2a02:b123:8010:a99a:44ac:6cdb:a419:601e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280ceaf0sm69201745e9.12.2026.10.02.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:18:23 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 12/16] media: ov2740: release group hold after gain write errors
Date: Fri,  2 Oct 2026 11:18:20 +0200
Message-ID: <20261002-media-v7-p12-sakari-reply-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ar69K8mZVNmDqINI@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com> <34f5f77ec2ddc7ff7a000603b120380c80bb73d4.1788360629.git.mauriziocasciano7@gmail.com> <ar69K8mZVNmDqINI@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added in v10 patch 11 after verifying the introducing commit:

  Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
  Cc: stable@vger.kernel.org

The stable address is a commit trailer; it was not added as a direct SMTP
recipient for the feature series.

With Best Regards,
Maurizio Casciano
