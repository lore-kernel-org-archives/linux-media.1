Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE0A340D90
	for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780656; cv=none; b=LuhtUdWYpIiA6iO2Z3PiLZhM0BjdutvJtwTZoCTIk6Phm8JXazlxX+qx6L2uCT/Uk6Q9t79nvhllm7Flre/oreEoxq3cM7aw7dpLJ5ZknBtbjA8UEwxMNVNX8Dl4QzFqmmQ18Ykb/jFL48DeTNXXKekZ2N6TWAPZv5Nsh1oeA9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780656; c=relaxed/simple;
	bh=HDTL7Qwkkul6a2ZjyQYMXoG1dxHEG5xb+MZiBFKgiZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KFarFu2jedchc0nV+RGMRbeJxF4XfdUnncmrKogSxhCtwo7dnUXjV+TEfjoJ9jZnR3Qv1W62k8RIZ13Ef2/S4wlYDqxqqzgpXVou59jB3pR/97tcXwucXOWW0LY6CX+9FOOqgR3YguFzGxRD4UeusdudoTn8+TdEDcVvCEXzabA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=W2NqY5ID; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="W2NqY5ID"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ad46a44easo6054802d50.0
        for <linux-media@vger.kernel.org>; Tue, 17 Mar 2026 13:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1773780653; x=1774385453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZELDsobQoxQXQzDBJ8enP/qzdQ0qrqtkjQox4SjNK8=;
        b=W2NqY5IDL6lX/OnC1h8F7yFnHuY2Wb5ZiWUF6D3OQeHisuXLzXjq+Ae/iq8jLmYsDH
         DzPCB4QLbjovs6MHArtAgFnDvQSkDA8LF6WKWuOPJq/d1Q/Hq3dgGw+HSIdG/WehxqWl
         RfyG1NudvPNvqyaL+oDKy2bi+cpk/wxn/MYBNWC/zaJk9azuJSMyysRxraX1/KriTCK4
         qO3LNCLjb1AFJnB0yzN97Lp2eSMiqQX7iJYeNNs+hJ3Tv1zhkg1rTV/nMe2kFWx6m2Gk
         j7eBgjdqp0EFWAiq8OqiUNXJ1pd2lbqo1Q6CqKuDgWK1m6sYHlNOYK5ZdnNt2uXMBWfC
         hRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780653; x=1774385453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZELDsobQoxQXQzDBJ8enP/qzdQ0qrqtkjQox4SjNK8=;
        b=hPWInNtc0rFbMQdYiUlK9TtsDVerGcrtlijmWgj26G3Uun7B01dnG18XZjO/3uOiYf
         TIJ+C1hutNltvijnAq3SgKlkOkVTTqco9QSEPwIVf5H+SEBigsutMTvjDwOym+tiKqvM
         znlesomT/eeko6a3Sc0OYq6iErsjweEaxceqjiZhj2Tx0ufPXvyRZnGMGbl43TPDzJOc
         0vZFWZWokBN+heeOBJ8Hr9+urmGZD1Aa/PASvBoReAESgsyBCjmzbCQY50r7MP122U5P
         oiYB1O8hDJZ9bRr6yZYtOJjvVBxUKv51Mj/MJcwi9IergDP7lR51EMwGGbnxVD6vOK7U
         AXpQ==
X-Gm-Message-State: AOJu0YxGbbn/NNqcu9OFx5dwgZt2j8ZCYLK7PdQhiQH8Kg9eSVs2026e
	K6tJI/JiSOHChxiYy26kICRD5xs1jAYVDeVgXE2A6+kXpY8D37jXLxtijsZDtO13T1leWIidTQ8
	v+ICzRW0=
X-Gm-Gg: ATEYQzx6pULRrrRb3PQoH8Tf3J7opvUSX+EGWc0U3mBXdJlkAHhlEAuUxBF+WMoA/lL
	BApuo5lo8+5unSG0QoPeyFZsHZzLvPiNq+7LdEBCPYRq8yur/gFtPSOoyqxCJZ1kQZ6lggXP5rF
	1JCrRahXm3ym0S+A8MXdx9KPmIAnMdg97yKG+5QsFYM9cAEHSr55TvvwdWa0tnwZs1YdgIwOCPm
	MvLYJFj5Lei2Z0SUrpcvfWxVmjsZzo2QPFtCtKeOcyhIFJ/de5rNUg8OsVo4cSK7hnTz8MFi29Y
	MW9POF7fGa/gQh5F7jaBJgbflwPEwKv1jvN45hB3bqWKEw0fLPxS6x5A0tGqudlhk0yWlBmFmyf
	xa554ONxJpiSFRyDsHsLK7gag0RgeSYMGAr/hODFlspHVc4ksOHdchs2PRn+MPX+VdpQFIJo6k6
	PQ+K1/cJYbcXnlKWRGSSkqx5EoTqPnmkW4FvPDzM7EYP/cGD4CFRBUROIhh34sBYBnnDiIGAdMR
	AUuV0wt79aRYI1mJEA=
X-Received: by 2002:a05:690c:ec7:b0:79a:3a79:a4c0 with SMTP id 00721157ae682-79a7188db33mr10681607b3.1.1773780653529;
        Tue, 17 Mar 2026 13:50:53 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713df100sm5031267b3.11.2026.03.17.13.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:50:53 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 0/3] si2177 tuner support and new Hauppauge 9x5 devices
Date: Tue, 17 Mar 2026 15:50:39 -0500
Message-Id: <20260317205042.3365469-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hauppauge 9x5 devices, such as HVR-935, HVR-955Q, and HVR-975
have moved from cx231xx usb bridge to Empia em2828x bridge.

This series depends on my previous series:

em28xx: Add empia EM2828X chip

The new devices have all capabilities as previous generation.
- 935 - DVB-T/T2/C, analog tv, composite, s-video, stereo audio
- 955 - QAM/ATSC, analog tv, composite, s-video, stereo audio
- 975 - DVB-T/T2/C + QAM/ATSC, analog tv, composite, s-video, stereo audio

DVB demod: si2168
ATSC demod: lgdt3306a
tuner: si2177

The em28xx driver needed to be expanded slightly to accommodate
a second i2c client frontend, it already was setup for "old"
style multi frontend use already.

The si2177 tuner chip puts out decoded CVBS video, and therefore
requires additional configuration when setting up analog tuning parameters.

Regards,

Bradford



Bradford Love (3):
  em28xx: driver supports two frontends, but not i2c clients
  si2157: Include support for si2177 chip
  em28xx: Add Hauppauge em2828X based 9x5 revisions

 drivers/media/tuners/si2157.c           | 208 +++++++++++++----
 drivers/media/tuners/si2157_priv.h      |   3 +-
 drivers/media/usb/em28xx/em28xx-cards.c | 157 +++++++++++++
 drivers/media/usb/em28xx/em28xx-dvb.c   | 284 ++++++++++++++++++++----
 drivers/media/usb/em28xx/em28xx-video.c |  22 +-
 drivers/media/usb/em28xx/em28xx.h       |   3 +
 6 files changed, 588 insertions(+), 89 deletions(-)

-- 
2.35.1

