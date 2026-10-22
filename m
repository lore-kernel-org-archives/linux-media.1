Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653275;
	b=oAFdJWJDT+QqxLbKLlaGPIPJnVYbZAstgPiSLs5+mLk7qIRAnStRrDjlXN3RUTFr74QT
	 v5NVtwhb1p5kcU7UQvsTXO4GnkUV+zr0CPSIu0gUGqYfj7kgJO8pAHIHeV2i1sldt1H0J
	 4vuIqRibgUOwwbX4Z/xbvUNvmIyqnNj7C17FGKOTk1Wm9JIxPYkrbsX4YLJ1bt/1DR6Xf
	 eNb9hSyug89/qQebukLr60vO5Eu208GzRO1SFLZHJuLohpWELwU2hMPzZMbnockRL3y2F
	 q8efUC8u+Z5weMQIUvWImDGajPMRFHACL3q01h8GzwOG9ZsQpati9zABF03AcXeZhAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
	b=h6Dfe892b9CJr2g3AjUfJUwrPpNZNrC43f6iV9kyLAQCC5sGwH/IEMUfl5OXiTSAQOAR
	 /6GOIb4NW0GmfVIg9ydyuyh2UIikdkt+6unzoUPM97NGdyYOjncKNUZPFkD/rqK6eQqxS
	 uzgS3XVOWE4mzInM4POrcbuxmYcNcYYp1zarZUFStjyelK+o3Tqgh2ihjoXAnzMiklfku
	 vbwDFaGuhDT2CuVFWMyK5sY4HvWl19bZREgxbdrup4UCk41b3Tf+Tuzhuaq0Wp+aOMckI
	 lrtmEjrJ8OAIcMlRKr6QKqd7JYoKVb2uTd07DQQ4RzL0xcCTG5gUypIfL4hRNg89J4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67EC606A31A
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 07:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67EC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lDNVZ+xI
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-181516de561so247325c88.1
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792653274; x=1793258074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=lDNVZ+xI4TWk8YtbkTL11n92mW4AB3EEJcGsNKwMrnPi6zNYDDFQGLFaZGqqo+h4Tc
         Durk78e1tFd31HvcAc9zIzRX9DHyAx/IADWbmbXIU8w+lDgNRVHEyKyR+jqxIk3U+uot
         SKw2yQy22Ju4zXIBb0WPRCG9bTtsGCNtkOqU1A0hlE1geL4i+uM58BMz82zrPbZNMeFk
         3xrsCOqmdOL5COho/iEgTPgolIROIIVEPDTwAgnDXjvHficbn/Z4YBODnJ1At2d0bxQ9
         ARaKtFIKivQPgvJ3RL0W894tmTxyooiqbjwg7tcrUiLOlKbLnNqijx+Y1tvG+cFWf0uV
         zapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653274; x=1793258074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeBgHuQ2F+lcGL0HOAeswGNlhahrF/21UKsiSHNd76o=;
        b=dhRm440Px9y2exUpRVdSc69hRVvz4KCyk295owbUj9xHgrtEAizQnZT24KrlhmjsBf
         JbO7CFFIPa7Tu/FM0Y2TPHe7TBT285ytypnka7K/b4fOOotu+XEKNkUNtE/dPnJKMCrS
         ZLcGIXhgxLK/dVqhmwplZdh3xhAKUXOO39cTF4/y7DMnOGLJx7wee3u7wLYV8kb5GRlR
         mqIf84FdVV9pyffrRfu25fM55lpR2DupaEUskTD2WVNoJEQOcCsvcQZK/S9nLgKY42FH
         J/bICA0FNl0N1f3N/Fpa32TZM/Z4hCy3gt/kdT2mmYsAWSqHpLBqPYZkXwSN4OJ2rzUi
         M7Iw==
X-Forwarded-Encrypted: i=1; AKwUvBxqQKnk6Rxat5uOr+Mw5zI45wnvcxN+NaTZ0iGCtqLIvO/AgfXHQR35roVmX1QUR9paMBJ2YrHNMJxyKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIc6b7WomQm4IzVYGgQnfl55FsJf8DPUFUVHi3mOQzsvhzzsTWd
	7mUNsVkHiCzvuNP2UYnsj++Yh8yI2V/rCDzat5AKrRmUvvLs5cBZOVlI
X-Gm-Gg: AYBFou1+SEXRWDvmvi4Cuh4TqT7pwRlfAHLcTLbRlHBofiFkBa5LCG2JdJxwwYqLCA4
	exQ67a2O97xB5mHsHHhk4bFxzabvP06T/uOpPguytSuyBDDeRPxOkQAI/u88PxYhdztvBro1MZ7
	7MDoAsQn1hm3rWQv45TXkym36TDUAR520yAJB5kWF1EqGmzwVzZgpPH5aHcBpgNEa7sBcl7HlHe
	6kOhrsDrD75ixp6TfVxLxNBWldadIH2RB3xofyv7tlkZAiAB9ka9x2GT/cgl61Axn1YaRh6Nuf1
	zRQ9gOzW5eXB99PS3B90so5qdz66rvmkAVf0ENBuLx93Uecv3urgui22vSfKTiTW2VZ7IIUKvu4
	9l8/A62mXHqiT61HkP2iGBPflbFOY5GJS2Fc8j1Y5tEzBTrsRHY3A2YPGa9gGKGx9oKrjK/d8j4
	CjudG3fBghstwwiwwZDyVqW2uRD7RGFQAOR/AlRk4dJPARTuc2PoSIikx5BiQLcobG3aiNJw7A1
	5tFjT8vQWwqzmoel/r9CPbVWQtnOFgUcqf5QhUZ6gB+Kk+JsjPBfg==
X-Received: by 2002:a05:7022:458b:b0:14e:d0ba:75af with SMTP id a92af1059eb24-192eebbb953mr2935796c88.6.1792653273782;
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
Received: from fedora-x1e ([210.89.35.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bd6b7ccsm11112321c88.13.2026.10.22.00.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:14:33 -0700 (PDT)
From: Saikiran <bjsaikiran@gmail.com>
To: loic.poulain@oss.qualcomm.com
Cc: rfoss@kernel.org,
	andi.shyti@kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	jishnu.prakash@oss.qualcomm.com,
	birk.skyum@pm.me,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 0/2] i2c: qcom-cci, media: ov02c10: Fix camera power cycling
Date: Thu, 22 Oct 2026 12:44:16 +0530
Message-ID: <20261022071418.26895-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The OV02C10 camera on the Lenovo Yoga Slim 7x can fail to restart after
streaming stops. The CCI runtime PM callbacks gate the controller clocks
but leave the bus pins in their default state while suspended. The X1E80100
device tree already defines a CCI sleep state with pull-downs for the bus
pins, so select that state before suspending the controller and restore the
default state on resume.

The OV02C10 driver also enables the sensor supplies before MCLK and disables
MCLK before the supplies, with the required reset and startup timing. This
series fixes the power transitions without adding a regulator-off delay or
runtime autosuspend workaround.

Tested on Lenovo Yoga Slim 7x (Snapdragon X Elite): 20 consecutive Kamoso
camera open/close cycles. The sensor entered runtime-active on each open and
returned to runtime-suspended on each close. Both modified driver objects
build cleanly against the running kernel configuration.

Saikiran (2):
  i2c: qcom-cci: Select pinctrl states during runtime PM
  media: ov02c10: Fix sensor power sequencing

 drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
 drivers/media/i2c/ov02c10.c       | 20 +++++++++++---------
 2 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.56.0

