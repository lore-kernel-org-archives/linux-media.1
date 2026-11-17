Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892459;
	b=15XPcPMCSXpbi77ddGT0OTTOaVwDPWmy+gZ9dONH8jemnIUToj4fCwuPES6eW4be8NMN
	 rIYj690jbehIuJmiOOu0jcJoyVRGWYEdTazrCbIQNlQ2hpcTHL8SEKmxC0/Ap2TMmaWOJ
	 uqbWmuOlEnGHgbwrQiv8XTj0MRRKls8BSimffRnbrF2ucUjCNMkh+R+M8Zbp5nLaaoJt6
	 G5JfpZD6UChjIrSjS3YxF+RANUPr82QNaXqchcNAbOOnN8+MnUgfoTV2PjQc86q4O0Tv8
	 vQqAYCMg6FTksV14L+RWMiOFncjbmyBDT+rL1Dw0OR80nr3qvoh6TvBNVlmqdF75VQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892459;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
	b=VtgDOai6E5wrrkTygJXLhHNtTj0Sg49jArPIJZGGP3oo2Th+ksPzB+wCv3Qra/lQcdGQ
	 NHF5UphfzeirwsMmVXd7qBrX1C6TacuumA/u5Fvr9pl0O7G0PQVyEMd7HfU54Yz8g+ol3
	 4/3YjJk11l9kU4V3d8CjHBSpPIFMVGdNhm3C/GFstiaZrJn5KkpSJUx60uUKfPHBBxfd3
	 0Am116kQd5iiEWJED+fI+lEFHdAfyR5q1MEupBMoJBhg6ZYO62Awoj2XRfzAz8Fxt4lXk
	 4SOT9nFmaQvcw5kDC37a42wBR3KN/MYH8jn6tLS8C8tfYvPOlavuHe4USSjTsi3+IbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BdGv9q2y;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E96606A32C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 05:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E96606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BdGv9q2y
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc147d86bebso415359a12.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892458; x=1795497258;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=EEvElw/RTkb7CDYHG6vIVeCbtExDVrGU363/3mA7WeRwk0q/rQMZQnMU8mz7PNxOMY
         fei40Re+Y+YJ3NwTR5tJYKZ2X3HIBQb+Kmaljvtywi4i1ldv8YMw06rmZsMvKbg/8xX5
         esTTAnLoPAAkSOWDKt5Nl9iJyIdD330C0zyWksllmIGcqWk7Q6mbsXcCxgC90zmCTKjE
         LnG3YHfi2xs03AeDC4fXCV9IsNP6f//phhthHTTzxJjYvlVnR4f/99Af3A19J0JVZdcC
         nLoyvlC8PZ+F45k/XxMypevTthlSWHuX4Rq78aqvKagwEyOlcASV618rek9cwFiGX/+6
         3jRg==
X-Forwarded-Encrypted: i=1; AL+hErHwrxJ0khFkB1C+2QNAJ8LwVSiyCfj2JHJIIhr6wwI4IhpvBzlyEa6C0sKk6Ajd7+LNhEKe1B+OJJ7mEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lZF8K+DlT0wsjjJgT3+4B+HLRH6a5TuO4D97OC2Vj4tFbp7N8
	ONas+wrLpkPEsmJsqnRxy2W89OJPtapXDCt5TRRDVHXd28DLoPAiaw62fw61/mmJn0UFs3oU5kq
	hx0Iw3H2NXaT/wr5wbog/0kV3xcCz/ve8JJLREt+ScHcLQ/eRqJP7xvEQSIl4DOkGt2sEi+z+bc
	VSJdTW1+J/mshCIuoL2JUkUZ6L05JHNwMeHnlpB0Eo8sAvrCR4Q77qGqebawu+35OMUL5q7o3dq
	MdJ9iPdq7xwr3s=
X-Gm-Gg: AZFdTZfpftJBvsGSkUDyqQ26WxgX5pumBjk1dnCe5m+QugTOD0t6oVuN/pHb/tf3Rq+
	QFVKaqM9ByW1YBjoydcBLnAid/9g5LVny5pSaviZBKzk+Tz/KJOosXaab6EWvJo7WD6r7EdpqGU
	bUHDeN5vACgNA4PeoeM5RYiLP2vwkkdqSQV6zzCCDX8JfzVnB1ACrhw14ThmORhvS7HzYeVgeM4
	ToDH3wnIKIKV+24bp9dOHm568JDU3IEhNF4PPjheyAV6lJUjvJ+54ZqO1QDh5B/NhMNtuHd+eK3
	4zYbz/WpuR6t4alevvCfCvcgMl8orwgJuYZhTPptK24ep6mJ/LPlP27oneeyipdAzxkQgj4H6oq
	9WUTEjFx1uELmkUx8mewfq/nP1UgJZksVoVUKy4GLzRsOBlzzIdOlQZir+08kkey+ZT6V1nxoag
	qFY+xYh7voE2A5Ax3UzildkcwsXxkpt31z
X-Received: by 2002:a17:90b:48cd:b0:3ac:b6eb:e0de with SMTP id 98e67ed59e1d1-3b3abafb5c1mr993585a91.4.1794892458017;
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3a17086sm6736507a91.3.2026.11.16.21.14.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:14:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so658486a91.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 21:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794892456; x=1795497256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SCfz1f0OOAQVJN2xpcPcFGbJPw3mdu0gWKPmT7oxwLI=;
        b=BdGv9q2yO0xLyqN+AV1p5W361CoGRqQ6JCzKFyiXI3Zs9R2BTBBdam1/T23MRbOgmR
         ZkOjDF8Vm9BJdr+zYamcZ4fE4le9PMtUpkt19aw7vYnkQQVGU/Y6P9UhjJ3BXBuM8A8B
         58jGxJ7Ad0z6/POSw6M2CwyiQU+Aq3QInssmE=
X-Forwarded-Encrypted: i=1; AL+hErHsruXTDagu73j3g85PtKLri36sIyVBFqwz7tHBeDietnzWFqNIUtjpDmZju67DTx0PYe6+kjwdNZd9qg==@vger.kernel.org
X-Received: by 2002:a17:90b:48cd:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b3abaf90ffmr845987a91.8.1794892456161;
        Mon, 16 Nov 2026 21:14:16 -0800 (PST)
X-Received: by 2002:a17:90b:48cd:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b3abaf90ffmr845973a91.8.1794892455435;
        Mon, 16 Nov 2026 21:14:15 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ab9f3c5dsm2158002a91.0.2026.11.16.21.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:14:14 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Vladimir Popov <popov.nkv@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Deepak Rawat <drawat@vmware.com>,
	Sinclair Yeh <syeh@vmware.com>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 15901/15901] drm/vmwgfx: fix NULL pointer dereference in vmw_validation_bo_fence()
Date: Tue, 17 Nov 2026 00:14:10 -0500
Message-ID: <179487959552.2515856.5690215138822621209@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414105529.9883-1-popov.nkv@gmail.com>
References: <20260414105529.9883-1-popov.nkv@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

Thank you. Applied to drm-misc-fixes.

z
