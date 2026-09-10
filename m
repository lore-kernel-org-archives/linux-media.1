Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72DB4AB1AB
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052063; cv=none; b=gFqlNyJmzrk9ymvsGvSqB8GreFY8aa7vEG3dqG1CmZzVoPJ/BuO29rOjI7HjCKEq+jPnVbpzNnrczhlyFYXiPum19u6+Jk+vlBvuKnHb1i/cFrWyMfoN1rQ8JaU1cuV9Uz7wF4gGUYrqAsDfpc/IJxmnv1PmKAoYZmxLXZD/1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052063; c=relaxed/simple;
	bh=+bkPUwN2hMVE3y7Yolp6psCq4hieuh/DtkDZpQvEXUY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jV2yPnlBljx4pUwSlc+EUcFdnxQTuNLl2w/Z5BmfSmPu7mtG/iYrvnVJKe8a3ScoW2ZWTI9R8ysJJLYAUHFTLwyfnzBP+keMGHlpiKGyEj5R7eEyj8/QpHlkQ4V27oocAhKaJ82bM4Fwa32c3SlFBJ6jdw29li8wE6yFPCs8zQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aqqTnoj3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aqqTnoj3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a68279dd86so8996662a12.3
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052059; x=1789656859; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LX8jitlbpM5cd8REaraZghKiqPQkzzWMZOq8r/lMnsA=;
        b=aqqTnoj3oK0EKm/ywIaHXnWGg+2XtRRn8Q2Fyt4tTIpKl1/dCTVuIoTAAqfPHAo1FK
         m+MzoYiaMQqPQiw+EqYKz2QLFkvDbUanV8PSaI1gqDJxTtCUSbnRAbEt6+Zm6L9OGqh6
         1cMt8xDBXVfr3ynnLBqo5Cxnq6qNRl5KdH0YnoLgzqKVIuGEF1oVuUgeS9Vyq8dyhyHn
         QzBArwhYXecfHuYGWO7hnnEC5szxsYpc70ZDAgALZU7MPkoLl0Iri6m9kh4TuHxecyvv
         U/+bY69BfEGmHVDq1d3Mae+QqDYcTfgFdkeO2nvtrqeXrdeHZDa/US3gAyNhJ3Li3OXJ
         tvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052059; x=1789656859;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LX8jitlbpM5cd8REaraZghKiqPQkzzWMZOq8r/lMnsA=;
        b=WhnawtrXoBxnFHa8XnVHD1I6N6Q9c53gCR8cTSUpQLEtgCDtgkhyGDk06vRd+U18PR
         Dkrl9lajyZQXyOrOUp5y6Mg7oOQ13uY8+LHsiqJjGl+CC0I/fb58o1wbFzXWHXbkshn+
         jjsgQ10xoLSfpxpQX8IxuTAAbf2ojgtbkwPOi2xzj8HIWfV0tKVTtdQY+IdagYoQuYaJ
         TKhhrKPEmnjcKHFB2ymf3Nn5OoRpIXnoND5bwEvwHafxAt/8nmtRgpkzBOl6jew1GCHY
         eminDFkr/MITxYKwxWMFS9kihH+RooOBoPgo63FGD5YS0kMxEXlEOFRyWQFMSXvdi9aN
         nUwA==
X-Gm-Message-State: AFuF++nEMYnkvK8Pff/bmED98gKUTenguj2U9lxk/sKB9WJeJjoV0RP4
	ki5QRVL6BjPpeQ7kUIaYJ7MIfELYBPvzoEaWGoJBNMAxpbHWn86jfcBX4ARUxljW73E=
X-Gm-Gg: AYBFou2rfFk3MZ4dWyrv9Y67gmZBFBHiAJSbl40cRV0cVtEYy3YLkfgX6/AA/LVmAD6
	lpGZZyMoE7w2D59PeSSSZddd9S5hPu2579wn61tXOzAJFG2NNykbqiZ0MRDz3pji0O2e8dd+5dR
	dYQUlOMXtFrqhqtyQpk0ir7BTatji8BqZDpyCW5ZnOFkM/5TVntQ/JrCbn3yYszYW+uRw/PHQDB
	6N2xFQTX5wlTa0etz1/y1ONrOQ+Syv/HmHD150X5p418Jg5CpXLBEKSIs/cABGLdkJb8hgiN5jD
	PmKumQM09i8kbWbjxRYYGqCWi5t2tGsNW264UXTDLSZd3+tPqDuiIlR3N80ikXhihbufmK9MWpT
	eP0Crc11az7Hg4IcH7cpTjZ9X2zbkYoTyAdMu960YovvCzps0k5TeO5+5WoUPxvMNiJFEC9TiN8
	lI7Zlh02BzQ3oWrWLjP6/dDFhOX+s2jJUPulHUHC/5OKTm12K9Ha+Bx9TPz6++8GyRczOmCR6T1
	Yv7MG7C3GWDMHj7O4fIsFw/5Zv9iITMhFYEMd6Uu5cITdbZswBGyIri
X-Received: by 2002:a05:6402:1ed3:b0:6a9:984b:4c71 with SMTP id 4fb4d7f45d1cf-6a9984b4d29mr4002866a12.33.1789052059015;
        Thu, 10 Sep 2026 07:54:19 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:18 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH 0/3] Dongwoon DW9800K update patchset
Date: Thu, 10 Sep 2026 16:54:15 +0200
Message-Id: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1MRFvjVURKEqd1VKIkWgXx7
 sZ2+Rb/HxDIMwWokgM8fTnw5CJkmoDttPuQ4DYaMsweqCQKk4t2UyXi8LIjabfOAo3ST11Ikrm
 CGM6e3rz/pnXzd1hNT3a5T3CeF4qEuex2AAAA
X-Change-ID: 20260910-b4-dw9800k_cleanup-0b9a7a51e149
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=1198;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=+bkPUwN2hMVE3y7Yolp6psCq4hieuh/DtkDZpQvEXUY=;
 b=h/64XD5qztm48Ht/9zBI1inq2ZW3FDmtZYfN1L8lRUe4d0uepqpvhwda/UUVfl5l9krOHofuc
 6Q4DmXNqNA2AMKk6Iblgv4+KJMxBGkhN7/QUHa2Rc1EU24PyymgEcX4
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

This patchset edits the dw9800k driver and related files, to properly
match previously mismatched register writes, variables, and logic now
that we have the datasheet for the dongwoon dw98900k.

This is a breaking change, but is necessary to ensure proper bindings
and driver behavior. The previous naive approach did not ensure proper
functionality with different device tree properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: dw9800: Redocument DW9800K
      media: i2c: dw9719: Update DW9800K driver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +-
 drivers/media/i2c/dw9719.c                         | 71 ++++++++++++++---
 4 files changed, 156 insertions(+), 12 deletions(-)
---
base-commit: 6970ecbc1f96154fb68107b467e6294c43947447
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
--  
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

