Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209643DDAE9
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872721; cv=none; b=esL3+gFxLn4M8fmjAF/5nG5Iisxqbx/grvlGpxtP4RRLPVh347LfY/Cd4qMSIBSw1ZD2BDJyCtzvIKuyyHlQS+wV8MquSEqZzkv+j78r/9p5ELg3xD5ml32VpFjuC/jrjce90DEcrjamoRuYSH6Vrp4wQwl4SC3Vu+1Cu9pHEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872721; c=relaxed/simple;
	bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7XuIp0+vVaMUERjKEm254ukLX41QallyQiJAG6tXooTQpu36X7gTU/zVU7NGNjnca8lVmLNL85arMScCw4OevQzIv5wrVXL03xc0NbsuHD4mr1DolRnJepqgWWwiE5sPqGi6wdOi7Mhi5poh8QN9ig53JEv2rX1BQ4HexX5mMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e71RqdlX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e71RqdlX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so2501945e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872718; x=1788477518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=e71RqdlXkOF/7EeOFNo+K2j3eTp9az3iTHHyxN5Vr4Ng2mSLXA0A1lQ+wMibXNjYzI
         GKHmd2SAcznDLEgvfnkSQ1zOtzLQmgljRwdjNEKLolhxQ4FFOo22lgwNpMbiXiMzZPu4
         prTuwVTsMuCSS4s+l6V9CFleK1GSWGiYPjz8NIJyNTkk+2FtaT0ECvFhY7sypCaxf8qu
         JMYKgxpXTStIOLDRQ29F5LRDi91Wt+rzXZfpM1oioLegegFmX3jflw8nJPon6We7aYig
         tlT6Z8zBoCaG0Ts+X88lr83TDdxCOK/tbwtsaLB+WX0oJJenNdfAry8mFLpBVfOM8g4W
         7oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872718; x=1788477518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oN1zCuqthbfr0rkodWrBBXKKEj5WG9R6WXaOcfbuZ5Q=;
        b=oSMNIgG71zdQ5bHlb4rBR5QpuFif+TPOXOQ/XQGTuR34At15xNxWk+4UOEjwqJghqB
         QUgwJNL3wscBCGD5eu0EN3kdZPeaupm1pcFaqqXKr7DDHtrRflOZwBwVpJtWpWGNDBeH
         pCSo3aIJMSCDuidfuDWpHhb0cgv7rUv2kBTRR5D3AczUyymI/+bmeZs+5zHOwPnQ4CL9
         NbsOcItlDf4FnPt+T8zcBIA6gDrOs7enEPmtt99rk8W0iLyaEakCYFjYX7CIVjkEVz/5
         MAJBw5eoecUHkRBeZGtNfCCo1bCNFag4helnSeAN9lMaqVZ1SN/6xQJ7DTYUHpKe5bL8
         aCog==
X-Forwarded-Encrypted: i=1; AHgh+Rr6aeK7sNRfs1OipjStGSSRPy8q+ErpT7ZWusgtPGIm9BdL2fvXeA9TurT638MrHc2+GQZbbQS8qdYCtw==@vger.kernel.org
X-Gm-Message-State: AFuF++mZUQUJZz/3WcjaRxH6Fi5bMo96pXdUKydsrXGVREIcgF3gobkb
	ltw10fHXbSRF2OUSaZTS7crUFsD0YXYvw3LofcNlvoOpeA4G5vqfEalA0T4T9k0m
X-Gm-Gg: AR+sD13eJr5SBPYpyMzTWO2impDRWVmamfSvu4fCbCiGhjHHKXzqyTAHaj4fOvGqTO4
	H6BYwWYDaFzYlkWGqlnsvzfR3rpGhicClXvxg2b7lDxrJfBx9C14jPuAMcO9N8Gfg/HgANvbg5f
	dIsOv3oz0PSyKOfc07SIXbtE7ele0K4R93ccugR9vufwGeklzSSJ/NkDMauBVIgP2LhGAAG7Nke
	rQklVz5VIn9ONLH2Oel2jw1np71G+4e2ckQs0TRS8aaV3U9uUA0fiV5l8+UYUOAfOKwWlQKPwsl
	uTjd5EPLy87VmHneTi8f//Lbp+pPJzIC4OR1s1yLXfmOZ/aFnk4lLpVkc2SYUDejopB8TIXj8FD
	rQf9H934d2RRJz8+5FWnIINdA36aRbJVVvK2UeH4q8OyihmJqw4pjCyN3pa1QVEXf2ASQFz6D9D
	bmpyUF4YFUiIW3A9SuY9d0twcmIKBhNZtkuQgMiuSJW9hbNyHkjRhzFFgsfWcovKFQ2n2UW2B8i
	zRkYuoF3HDS4iXXsl33RozSkOJM7Re+TvpkSCbMrQiH0w==
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr35819775e9.10.1787872718427;
        Thu, 27 Aug 2026 16:18:38 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm89930315e9.6.2026.08.27.16.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:37 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/11] media: ov8858: support 19.2 MHz clock and CHT gain setup
Date: Fri, 28 Aug 2026 01:18:34 +0200
Message-ID: <yogabook-media-ov8858-pahole-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apCUKIgOZMoeSAP1@ashevche-desk.local>
References: <20260827181756.2430054-1-mauriziocasciano7@gmail.com> <20260827181756.2430054-3-mauriziocasciano7@gmail.com> <apCUKIgOZMoeSAP1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

I checked the final v3 object with pahole. Struct ov8858 is 792 bytes,
aligned to 8 bytes, with 4 bytes of tail padding. The xvclk_rate field is
at offset 8 and does not introduce a hole.

The original digital-gain explanation is restored and the existing
long-gain programming remains a separate helper. These changes are in the
v3 series sent as a fresh thread.

With Best Regards,
Maurizio Casciano
