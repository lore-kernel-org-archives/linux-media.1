Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3024156C6
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344873; cv=none; b=dKJQlw92Az8PZMXOVXj8yUzuNtDP8GRCKUaIWQzgjLfgMBT1YTqQHkDTx277cq/DX6iyrFb1+oXz+/Twsp91dPRc0w/aLqubh0dHXjYgkmzoLgxoqHJFPy7jvnibLttK2DEU9zhCwJqlHTrS5tSqWEAdtF/VPdraNlILOPNU8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344873; c=relaxed/simple;
	bh=pPSd7gJsZOWjWGxxmlOEM5bAm98S7i9NipPWjEvlfxo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=FB3AYEHFgUPmHueorfTX0qBP1pLrCjgXJJXKszun90XsC/vUntjdfHz0y4MWbhibd0yS6WTRSChqfnTuPfuXHImKmDIJcq2LDoh2gUvkLhuy42Lm6T67QopGm386LxpdIE8UOwXJ5sA83515vcu3vrKuiVE/TPm0+du5HQs+4rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U9paP2dy; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U9paP2dy"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so7175981fa.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788344868; x=1788949668; darn=vger.kernel.org;
        h=to:content-transfer-encoding:content-type:mime-version:message-id
         :date:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/5S0S6aLWOCzp/OlOe+pdAt4oNh8zITGsUNSrQLZiQQ=;
        b=U9paP2dyja7yyuI4GTc76qSV6A3b7Z3Bf8zrlJLQyFvwZRF+Lkm7kPNGMHsXBBCwWc
         w9ChNklT7K/a5RYf+1uEb+cuC8E+oNWL0nx4PixsGReXywpyoAEYzCX3IKc4U5Khn4Mo
         M2/QER9bBtFZ+V7yZKMbZyUO2bptHpFvBi0F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344868; x=1788949668;
        h=to:content-transfer-encoding:content-type:mime-version:message-id
         :date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/5S0S6aLWOCzp/OlOe+pdAt4oNh8zITGsUNSrQLZiQQ=;
        b=Moky45iNpdmqglhG2GxfKGLcvSMaItDTxxQqkk4ceDR+9uk+k5HABh4EozqVjATVvQ
         RkGHMpPz1f6EZQNL5dCovlOcfHt0EG55ZETVEnHLUVL3ZNG8mjLM1z+KTn2Id3eShKIF
         kcCVUdhj9G/sLPWFIcJO/oBNPT/z4ui7djP8DhiKDNbfWszTX89rhT6eyNrPN/W1Kh7p
         510ZAUdOuSVSWiMfZkZpuOCy0QnZGXMnmPMcU8oD2CC+//NO23ebeDQEQdEWCSdj0+uy
         pOABl7ARRUyB4P34SyYQHbwbdWEKYSq9lWbR4exQO3twiEWSRsPeFyhRYlHLrtN2lT0P
         gxZg==
X-Gm-Message-State: AFuF++lJqeSQX5pBxOAJ6AWF1ygYXR6wCT+8Syl0sF890PBe1n+Y0MHZ
	gWPvgkXIWfi9fND7ume3Z5QOLelEzYam9qJNy8adaazxgw3Zxgod9ZKlvpjBdn3tTQ==
X-Gm-Gg: AYBFou2vv0PH6UvDdiUmUthIJTNOtAv0a+nnGxSiz56qEgNAr9nEQ5TyI8DD3FoIQwG
	CKJjs+o/Ve653n/BRF3Pe6zvxWAWq8RGXaD/jN5I1w/QsobIJf65+CWSVC4vshOZaCdhQwxZN5t
	PznQwGY2efIpWFSyQHoMTTgGOnOYvXHcrit5I8k9MjWAmmCk+5lZDIJBAn6UzJdj8GjApETNB8Z
	MijXy9O+X3jRrkz6cZBvzli2UdDQBxickQNoESZ/CxQnKoPrOHUKz9sjzaYTsSiWNBeg2yeLBt5
	sLl9SfHgjGZUZaVLvufDGcaQpKqg8y0Jk8GhHDo1Bmy30Wpd5XKGWmMezGGD5AMXwzXYVp58RwV
	JExH9DoYn+UxFHuVsMt3vE3WV9lG4tEXV5GFGRi/XySr6/epzqoeZ8xf3gOvUl0gKamzMsizuK3
	IQeG4I2ev+FPe2djVaF6wi+3gm6rvREKPn0Q/jZhRz2xIPpo+SafY2W8XxzBzJ+7a/8js9j7UKi
	mXrOeLTa1iJ299mw3ruvl+hG0FRCieIcpvpQtA=
X-Received: by 2002:a2e:b894:0:b0:3a3:42cf:c035 with SMTP id 38308e7fff4ca-3a34ff9268bmr7476411fa.2.1788344868584;
        Wed, 02 Sep 2026 03:27:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f0ef9sm4910841fa.5.2026.09.02.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:27:48 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH camorama 0/2] camorama: Handle properly ERROR buffers
Date: Wed, 02 Sep 2026 10:27:39 +0000
Message-Id: <20260902-contribute-v1-0-a45d6e93efd1@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABz6l2oC/x3MMQqEMBBG4avI1BuIQUS9ymIxib86hckycUUQ7
 26w/Ir3LspQQaahukhxSJYUC+pPRWHluMDIVEzOutb21pmQ4q7i/zsMOt9OjM5xAyrBTzHL+c6
 +FHhLyhvTeN8PDGqniGYAAAA=
X-Change-ID: 20260902-contribute-e8b6dae82a4e
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

And now that we are at it, add a missing CONTRIBUTE file.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      v4l: Handle properly ERROR buffers
      CONTRIBUTE: Add simple contribution instructions

 .b4-config    |  3 +++
 CONTRIBUTE.md | 23 +++++++++++++++++++
 src/v4l.c     | 73 ++++++++++++++++-------------------------------------------
 src/v4l.h     |  3 +--
 4 files changed, 47 insertions(+), 55 deletions(-)
---
base-commit: 645f7b9072187a5d9a9de520e074dff3be3a2bb9
change-id: 20260902-contribute-e8b6dae82a4e

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

