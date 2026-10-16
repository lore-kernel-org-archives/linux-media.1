Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3728A40BCDB
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189525; cv=none; b=UmDGI7OeFv9TBddVKdQ24z2hOvlS3vmSL5zuL6PMchZalSUQBmZzAxzCThwWVmplX1d/V66kqG6GoiSu2OjUowlgHMBCv633KSZjyG/p1orx60yg80bd/Cc9VbGaqlZJT6i7yIKxRg0YrevDgfQ3WQA9VRE56Gjb5FQ6OaunHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189525; c=relaxed/simple;
	bh=HGsrAtc0dxK/Dg7F5pK3YyUAMin6RMPY0jRmrJMCC1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QlbIKFVgOC/hzsnMQUnE/6JtC8VDvdj3z33PIksZBpxQDH+rdTvR/df60ZS5rqHmLNQLoT8OJLaXpEvvKJ1ilEyFMm7NKUJy+RWqRMASf04NsSsH5IlfUU90KgQsCsOAUsKMZ1q48CtKggMQeEFUHPLFCv40dXsOvILiAtH7gyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5aAAyjJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5aAAyjJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3533245e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189521; x=1792794321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EsJugF+V4C177v7yT925TOFVlw+I1rckddRVMpj3ZdA=;
        b=I5aAAyjJ2lTJ01sTxnFGqhq+4qKrt4GO59Lg8rcbUKN2vfw6eHOSAuzHSpyBbmOjjq
         1uQxOF2hSsmkqdEFHLZzJub/GbXA/BiKUeAunTLgAkuH1UZU0XbgJO98Y2ZVr6Q3J37q
         H+pPRsRsM1MCHTVuYo8Lb1pgW/AHAYSAO5AeuC8WE4+1c+Ac5IpsXGI+nPXSqFk5ocgh
         gPXCo/HOCHBepjWMZNIWUy38f1V5ZxFUM8MzS1/rqbVjjPqaE4pqUWn/V6oK4ip8aWWc
         aWipcpWOlWpkDbNzadcLXwSIslVGEsxl/BRh83Vcddh+CCjU95+/JM92HnJYGl6WDQig
         MJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189521; x=1792794321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EsJugF+V4C177v7yT925TOFVlw+I1rckddRVMpj3ZdA=;
        b=JY8JJscGldV2YFOKif7U4YJ/a2t29CJl7VTNh1s8KFI/FR3enGY7WAxdvb3OarOH0M
         xCDaKTo+bs+ZUIskaae/JicVr+LurmsG/poGcX73H9RmKUET30S9eRJYC+hhJyWAvFKv
         EXCnqvWRdvfY8m3rUYpCGThfndvRJwiPgM9Dtqhr+nX84L1SrdORKnlFqC7bCfixH2HP
         xtp41lJozzoD35Rfwrw3VucCq9fGr7ZtNw5CoMHb4g/whqBnNKuw6StZqolT5xMkjlGC
         nHCuqx21vnhVZL3KQvnfBIauVpL3edM62RN/w7BOWGGVmRbGbufBg5XG3PLQybpm4JSM
         aIrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQglZWUtvbD9aPN1LhdPLzsNyzOHDJ7L3Q6HhV2hh3eTUwuZt2q+LaCN9NiDgaYbPAHr9IlIWHcXZeTw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Lx7agzkRVn3IfqNcuakdp5Pa1gOWqLPMyNrMy7OIFpejL4+X
	JnXJLOm4OCfRUs3kd+Uscrd1P4xFhgPhfmExbyES8/K8GjO32Lx9omOi
X-Gm-Gg: AYBFou14cwRm005cYEfGGKjAu/b3SVT9GIfhvWMylTz7l3tV3NDV9v0kTVeP0t9chFq
	INw1U0AnxoMe4xNSbhOVIytDXFNGy5va0RdAA9rotPrYJbCNp6bcC7mks+sb/AbYFABizowcOeb
	L9IvTnpmDWgluYB9iLWej4Z9BwF8iLA/2xBWnDigOoUYI3UvZ9VMBpO87bt7VsUJkoHF/nBVn6s
	DrP0FNBxAMfMgoRPlBAWCncNE6ARsvJToUI+t2OPfmyul/277WXMOGV3dc2lupymqCvFKaIbE/S
	30hiYZkRewDNkSdB6ZspWDKAkzgjlBi2MPEQjqwxuj9k1AUPpl9RqUECOxKUcjKPNxYDxpNCWBf
	+aF++C/sX6udeFrvmQ47Kz7luKbrmjew6TwPpzLujFcDe+9MUtbXPr5LdzqyEtBNjxG7chM6b/0
	ZYydwCQ8KY9QH8kLpMdoBDv654OsynbZYv8y61IZ8EVTifJ7QAkQ7aZx6oFMUCOJL4vf3aTK7G9
	0JSlxmwstDPSJh4+v/GvozA668G2Drg5k73TAoU21jXqQKhDl8yRYbuliP4qV3snb9hiai3
X-Received: by 2002:a05:6000:2611:b0:48d:ef93:67a0 with SMTP id ffacd0b85a97d-48e07fa8300mr1816606f8f.50.1792189521095;
        Fri, 16 Oct 2026 15:25:21 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm7280051f8f.9.2026.10.16.15.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:25:20 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Simon Kruse <simon0x+git@proton.me>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov13858: Add device tree support
Date: Fri, 16 Oct 2026 23:25:17 +0100
Message-ID: <20261016222517.23525-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016210802.60605-1-lsa.uz@pm.me>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com> <20261015-ov13858-x1e-v1-2-acdd918f4fb6@gmail.com> <19662dcc-4a25-4d18-a3bc-6b277bd676a6@kernel.org> <20261016161618.209290-1-geocausa@gmail.com> <711e8518-5054-49ab-8432-346049a86cd1@kernel.org> <20261016210802.60605-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan, Sergey,

The runtime PM test I promised, on the Surface Pro 11 (X1E80100) booted
into linux-next with the PHY series, CAMSS and this series:

- 20 cycles of open, stream 30 frames, close on the rear OV13858: the
  sensor was runtime suspended before and after every cycle and
  streamed every time; three further cycles that saved the frames got
  all of them (3 x 4224x3136 RAW10 each);
- the regulator summary shows avdd, dovdd and dvdd of 3-0010 enabled
  (use count 1) while streaming and at use count 0 between sessions.
  The supplies are real PM8010 LDOs (avdd l5m, dovdd l6m, dvdd l1m) as
  described by my out-of-tree SP11 board DT, not dummy regulators.

That run used Sergey's v3. Its power on and power off callbacks are the
same in v4, which only drops the system sleep handlers. The next
version will be rebased on v4.

Thanks,
George
