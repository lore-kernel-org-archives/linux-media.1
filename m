Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35853D1CD4
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862102; cv=none; b=sRXExjyceUpVrhOFQkcecX827CUuSiA7FuTyWkJHSi9VD/22X/oTV/+IzRD4Nqsas1q/QTv5RyUPoWSNfPXRmq3b55smMs6uqhDXEiIKCS1DR/6S2yZgbQAD1VKW4cRW71UHhgU7UGzCPTtIEvucPQgCMhDsT8fX16F0idtDrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862102; c=relaxed/simple;
	bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W62CnRty9txNjXiO0ke5/yCaE0XDHlQH/60yP47hUiaOwo6osKOoWTFpU792C4bniscyGaBxepckLYaOWDejs9TM5uXkejovL2b0nyYNQnMa5oK3jIjjhGdwbzE+gmPSINC5OVEvmZ06q2bxRISSzat1mMpMyKaI2TjUcuv56BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAlGEQxm; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAlGEQxm"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c648bc907ebso3459974a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776862101; x=1777466901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
        b=OAlGEQxmZD6wTNi3jO3C8ut7ytXUTcfUW4NrEkpXSdFNVihUM/WB1+Pv2JLELMc74j
         yS2dcbbZ09DS1Xzvcm+w+rNV1VZiCXzPPeCEl+vTmaqHrPVtGfRUHGYcXH6WloetQynv
         uk5+tR+xUAIJH9N/7l366ytdY9KA3rZzjqGcRINQmtHniytQKICOQ0ZU4duH3IHPZjJt
         nd0L6VH3TaLpmBUgQGo8hZ0w/Rj7LR9na2YRmvqha52npYAe6LIlQvXjb6qHNxep4R5u
         VOu6nGvULBo3GZ9YyyTVym7QBsD3Z2nFhjYL24qsNA0AoXNGF/bykb2bUfksCfx1oLpL
         +uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862101; x=1777466901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZaPvoBmoWaC+tuABBrtJ1ZTMUmTsQUEkbKx5pr/GKXk=;
        b=WC0uCORAwwKuPyFAqn70Nuwl86TnAhAqO6LohVCIL69IzlUf4ro0wHNqs9TksCofvH
         RqV/1XozKqbby986ZFu0+rwMUp3+kaR/XWL4ebLS/EmdG4lw/9kOXwdVcE5N7/ZpkIBU
         W0P15ARVQTWVSq7x50S3lMcXUKftVd4xvOjNM743w5iiecUveeXrr/6Fp9OCWYH9ujVI
         PZKJ4/nbZtDIW8G1hNqoXpFTfIbkNVLV+X4i+CeoathdRLTMHp7bygUW7/sSuXwUNVev
         YCTtVLiLqY2NbX4IsEC8GL7Vha/zmDMCWsTZDG8d6g9wsjeDEXgVWNQTPj1sxQkHFcYf
         Fk2w==
X-Forwarded-Encrypted: i=1; AFNElJ8xjRDHc4P2/ejaPD+2uXGlYF4zEmuPKz04Js8VA/kMmRb06ARwQ1d4Iyk1RHVaKDdFtH70ppRketrQxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzizs85YsjcuLIm8TD7uS82U5euYg4pGjZ0pJj6ffwj7gVo39WR
	m7yMtHcUlsvWESbE6ZVIsetrj2F23N743PyS+T5b/Uj9SQlwDAQSWLSz
X-Gm-Gg: AeBDievTP+GkdkvapaC+30ce3Ok7eBgXzHzTLPPlUbHX3qOXpmYeUCHe13QE6LgqbF7
	Cu3a86mz4B3Wxey12I8WPtmKYp267aXPb9NfqLVtifEsR9DHhmUdQMYb+kLnuDustMfOpjmFMWa
	oJ6FcNtutuyNsOl7qfRYy8N7wqN2NPkTxafxM3TZIHCm4Xj9FWJfQ26i5Zo5xYr2focF2u7FLw4
	Cuz0+U5NultoSvponQB8eDTyY+8Jc/w7PyykiEP7baQ/BueCJvtjPSI6mezvqZZY/RewpPj3Cfk
	1EeH8rvoP0MlYZoIuOMoLrjlakRRKXKuL7dDFbKAldkOczA75yXUiuOwj/uAdj1OE7WLwdvSFy7
	O8OW8LQoKpGx5yuMGmoxayzUSgvLH6yNiN7kO7mNHHmzEypxcGSl3dujxPOSrPo7LajsiiMlqL5
	u/gbe8VHYu10zf3F9fYsrqJIiRM6bg12ODcE2HI6/qgBWTwSswbehu
X-Received: by 2002:a05:6a21:e081:b0:3a2:ebc1:4620 with SMTP id adf61e73a8af0-3a2ebc16c9emr8661555637.38.1776862101038;
        Wed, 22 Apr 2026 05:48:21 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f370sm13482572a12.7.2026.04.22.05.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:48:20 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: Re: [PATCH v3] media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Wed, 22 Apr 2026 18:18:08 +0530
Message-ID: <20260422124808.37695-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
References: <aejBTB7JUYb43Fqi@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 22 Apr 2026 15:38:36 +0300, Sakari Ailus wrote:
> This won't apply to my atomisp branch.

I see the issue, it's because of the indentation problem that happened becuase of my IDE.
Should i send a patch v5 with the indentation fixed right now?

Regards,
Debjeet

