Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279549;
	b=zyB6QzTKBw+uY0FgSHrzgMHOg+TUOXJKP+BwDwoUsmJzPNX0gNxFimEbdvLZ5/FfIn7e
	 lnn4HWHrSSmpv3+Sby9hDHJEISQVDR7lVTXONuyXWv0S0TT8TO6X/Hu4sxPqYuT63L1u5
	 tfWtscb2ZX5DqVUvxOh5jaC0AD7ucnhlow3aWBRw41siqLXUGtrCiMprAi7o80yBI8MtN
	 mrLZufmKpYoYOfQ2bYuE911loWESlUZWXl0viP9Qq5KgW9u7M72KQnuVyFh+6gpFZYU+U
	 c4IXRe6/d/55+2RpMXFaHXGvKJ9WDxP3hZr2vyfDzeyUoQj1jACiQVvu29mBfVDPNJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
	b=0BUgf2KL+GWPGJC2hyy6urSpMVDXd1NT79zPLiahHig0Z2wWUPn+DuNXFxTZdVS/eiBW
	 K0cdaJeu5TPaKURdQOcNnCM3mRjNzV1Jyezop1+S2RpbYznJIOfCsmHfd+THl5FLHm4Rt
	 jEPLM8GAffK2CASkBomFrkj8+KTm5X2J7t+sfRmY/4PMP7Ps6t1YZ4LHmkEoJHqC8NA+K
	 PbHE3MKQZGawGwzgwbaKNeC6+LHH4nU+/yK85JZtTBPTmsaFg+XRaZxZ7fzPAhnHmfyWJ
	 d3A9Ukzo7VYIK+tOaEyNgdtpxH4BQaY332TbmdThARvtRps9hjhp6JMAj88WK1puRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC59606AA10
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 02:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC59606AA10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5365f9a04c5so20074291cf.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279547; x=1794884347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=tVs11Bvbn2d+gL5BWwC2m/viV4nrJeThHyuvCZDzw1Fvz4vCP0E4CmVRFsXywgJHIY
         7LTSviGZ1TH20B7cqWPSnImrklhjzzXSicv358px46izZzvsVQBbXufQHCZex31NLJbV
         1Yjqu7vKkr2sQr5GU2L7sVRoDf2Q5elBoQwKzbOiDy7mr3QzRgDLTrmevKYP3F8DmsE8
         agMvIRPrZcSXmAJTdEh2fkLpIG4smUtofpVr7fzO0snW42MVbShD+ZXHAfITn7XFOMEZ
         EIy4K5RboZwR6wZEonkflUS3wV0/xEQyuMEOSpthO7kX5F+LZJ65NH55+Oz4iWbrg4T+
         Q58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279547; x=1794884347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=EzW8+JGnUY7TW0/ez7XyjThn/ACjVhwUEzhBCHPbw1BYdsltgwzLYyDOHivhPj0MqK
         pPsqDKyDCCt9hipvF7/lkjhyBvlyl7gdz4FLxLrCUCAT5qvELLmzKeBwqu0C3zWWcqHo
         6quadf6TFynYZsL+MKjIdpsZQG22WFRcy7c5L7hKM2i2D2XbA+0DlFzHNVTAEo1bmsk4
         YimCihjCZEnggezJp1LRWsZ2+/Qq3isSZVuYdtVUr7rSmEniQnz9MEcu69h2xyCE26S5
         yDuGV2uUEPyDHK9xO50VY3QZYiAWK5wzUiRp+wfzyOro7fB1Go4KDqYXvev5V9/3gWcX
         bX0g==
X-Forwarded-Encrypted: i=1; AL+hErFb6IRcxU6lPVeUeq9IEbNnFnmDpkARfiE/AUutzpHmNfym5P+6BhjgqLZHernEavkGiInUrP7Yv6u8Fg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/jMbCf3xszwfRNplmsUT43rn3Jy9IqTgMMoSiXkNhRU3FSIRzk
	xG4fWmFYG40rZHW4gOQSa1gVZbUCJV/V7gyyUJoH9+ug3JfDvS6btGU=
X-Gm-Gg: AYBFou0Ev0sj4HSk2DpP8JPdBuFEWkFCKFmK249iHWAYH2XLXoj/rEvdMbwOBSMDJ2W
	m9Vy2Hf5F0Nonf9hDSYSdJi9m/ZypIXcHNhvwxDVXWyAb4CMXI8catsN7KS1UbWDc/8kEzkOjV0
	DVt/fC2qCG/Vp8PRNeeSYsqglSlnTPnQgDSWKaLn6GrH5Bg9sOh2UEq7qHxngKv5R8Z3brK7MhO
	hPJaAIPpQv8I75Sjeb+udIhpq1v75uA02c+eExAWFi8BMgCJYDVCT09lXrcE+GDvB1gXIVQHHPu
	hHT6XG6vhOZPwcq5Q21zxE6WbqAD+7tblDuPW2x6x748quu/AQqk8dVGFMKKE6CCOr1e4yLegPq
	5HGKn4UGxOFxu749WuqqTPrk04LyDBjwa2Hbd7Km9arYKR2wNATBxz8YyaMdX6yAmJlN3uvpnD9
	RxKS9TQEBrX9U8HMGDwa2qfLvKwrF71797c5qiFqalt4n3CYaE4dsqHDSJECpccNiW8ilSOG6NC
	YfXcjKbzxkGZmOvQdGt699OoapQ7A3Mc5cCl1rh0z4RyfDv53uRsMfjlfArm4Va3PlyZQGoEbmh
	JwOjB3ipp33z/46EdklmdK2pfBuA91gXQmjs/CRSDZUiNVPDoCZNQ1u++zr9ilGIoskiVTKwAWN
	IE0YFiYgY6HgxI82GEYlFzRWwJtXJfOpZbNC+O5DZEhs5QiE9iBc5kWBggF+R4eRA
X-Received: by 2002:a05:622a:4c6:b0:536:6d2:2c0e with SMTP id d75a77b69052e-55527b1b214mr20635311cf.36.1794279547476;
        Mon, 09 Nov 2026 18:59:07 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:06 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: rcar-isp: fix core IRQ and probe error handling
Date: Mon,  9 Nov 2026 21:59:03 -0500
Message-Id: <cover.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the core IRQ lifetime before distinguishing absent optional cores
from initialization failures.

Changes in v5:
- Regenerate for git send-email without wrapped diff lines.
- Use media-committers next as the base; no code changes from v4.

No hardware runtime testing.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 .../media/platform/renesas/rcar-isp/core.c    | 44 ++++++++++++-------
 .../platform/renesas/rcar-isp/risp-core.h     |  2 +
 2 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
