Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795396914;
	b=i6vKrW11KL2WQVdQXdjAQYw8P5x/47MKomHQ8M990ZSoyDf5UCIB6EtK/Ss7VqCRr8gj
	 2/vOPn8lD6O8HMSMFGHJUJx/Hh0JLbE6XYuGvruPRpTmnr+ilzfjJ8gwY4TfTR3hrtPrO
	 cu537jnxiDOz92PSWPZ8BF3YxTXDtwtcvwwVIDzcDVDE9x1bkf83Tnf7A9a8HbMyFXI4n
	 fzW40hwfEWZmR6T02k7/wlTQX1fePbzRJ23LqESkkQyCVCUL0SRYnbsiB0HJ56ABuY9T5
	 nuAnY3Sxz2eXQVa5FRVaDInExFeDJefLu3t+mWrb/srM3cXkN+wh2JlifurhRIQn48g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396914;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=JYlBlKJSZmlOJjUYYjkGeuYLSTkrs63kioCVoaAIGNg=;
	b=V2d8w7+ymzVxby+TGotzwIT2o8+jhldc5ZaAjY4ge9GLQI3xHz+PwNCw9TU1paTFXYHW
	 bf0jr2QRQiMFKwv2Eyztro9J3tkmLoiTpTyxJUNnmxeP7qLAva1usxhkPmIkU0Ryusi7M
	 wI0xlLXQEkm4oyC0zD7ndve5eROqje/jM0klq6+vxYtJ1N749/O3+rvsypvOevjSqVdT0
	 NA7zQ/KC++hJWQUJZGs/lvfh1EpHxpUppD+9U06W2WhGqTtsoFAE65RTtS4cMpKG4aDO4
	 TdFe7NbAypyRi2/ERRRDfikE4ZpTkKgZmdCq/lISTcZoBi4EsMLM1jEAA6nRAkfVDsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIE8RgB2;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E25606A333;
	Mon, 23 Nov 2026 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gIE8RgB2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396914;
	b=r5yCaVHMl7Ry/HvpSdLBffVJ+0pa2MKiCbQq+TUIj8TvcDulj9qeev0VKzpC/Nlwcpbh
	 nlJNsQuDHYO0KiPmTF27DRxcyu3qOnyed9/VqYz/OtL39OIZhBaFUJQqcxvD5TsINcQEI
	 z3Ax7cNRLVeRziv/CgcldJrSGEaqKFsgrZIa7zmKexJJhzRQXVIO/0JdVVvysSZDR2+UC
	 tOqFGlYD9pO6MlElwPWfRhpS0oszm6T9XyZzA3VtdSW9T8OpzgwL3YKZ6Pp9hKgTkjK7c
	 FziEO0RueTJo8IvhllfkSDr8GYeT5AV0kzyOfRw6IuRTKj2dm0RGCXz99BVRXKtcLtA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396914;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JYlBlKJSZmlOJjUYYjkGeuYLSTkrs63kioCVoaAIGNg=;
	b=ccAQqcpjoCo8u2cpBxQvYb1P9Upx/gBICawquTT1Px/vzisNUjA7nurLc2mRuG0epyE+
	 CfpdSIw6bKtMl3otip6oWi7XY0Rlk7gc0D6K/Vi7n8KNFj0uXPY5fJjb5Srig/XS/dXF5
	 nM5QaNuk4r2rwypUqhBzWSqlymg6ANmdhHKhQAgCv2U3l7EuSKTS96pGPWH1IxHT/lfUP
	 r9Z5huyqhFWbHWEg3LAYJQc5x6JWsFRW3+0b93eSuXwHgL2OY0LYeKdrLjtAd7RX8BAdl
	 ICoKFju5+Qf+qJFmnVwQn9LvZ9jdTFtXe0G7nKawx3H9W8ym4/42vWZYRQXkyrTlxRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 535CA1F000C0;
	Mon, 23 Nov 2026 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396914;
	bh=JYlBlKJSZmlOJjUYYjkGeuYLSTkrs63kioCVoaAIGNg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gIE8RgB2lRQktxXuvUt+9NprntCl3jmiZ07Mr/MvrvAat7nsTjr+b05XCFhXty5to
	 Q8cMVOdXjvJimXtJIBpLJ4oeNKzXNIxjPRcMv/jTMvGxAitH5Jer5YCWONY5FG37py
	 s/PnGo+dRkphvcsWj1ditqD6hFu1V1Z7uOcUjcrl1QOk8PLJ1NPGZsgctz6hfatxJh
	 iCUEuMbZo94p1d/KNONgOzq73bX3UZUKjjdZaCjGwYXf6vTlmhnpmZKXKt1Z6xjnem
	 pVJEH6ixq1Ju81NN60D1gK98PYNMrYDFS4pBUqLOQc2eerkgdWRLEvZivkQmem2e3I
	 PAUT9LNoGmf7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AA5734C2AB;
	Mon, 23 Nov 2026 01:21:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/3] OnePlus 6 and 6T support for front and one of the back
 cameras
Date: Mon, 23 Nov 2026 02:21:45 +0100
Message-Id: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAyA4VeRnBdo6yiyVxk7xJppBmpJVATx3
 Ve343f4/wOMVdjgUR2gvInJPBX4WwVpoKlnlK4YggvR+xBwzhHXbIsyjZhoZCXDmpro6juxaxK
 UNCu/Zf9tn6+/bW0/nJbrBef5Be5tqgV4AAAA
X-Change-ID: 20261122-op6-upstream-cameras-3a86034ae08c
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EUtTl3VsRAoTueX0+mnNdBvhuxCaj+3BQqgT522isR8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA5Uvjw6EttivUxmePLaYf24+QLuWCs4qGQZ4K
 jw4LD5lZ7OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawOVLwAKCRBgAj/E00kg
 crxQD/4u6z3rKZgQfw2Wk+FpWSFV0pEGcL28Jfp2ZToUj0lbHhaA1VT4eFVBNIAk/Yzkd+uQx40
 tFMYOC2/83W4hNcirE7z1Aqs1R3Ttkl8AICUIhayI+0Rr1JSjuxAHZf9aWOO/o/Tai8ATKep2YH
 JjO9ZxWi7v3uZxAF/5theQu56JplPd643joWRwK5t8lgDTofOW6IcW5v5LPhlmQwgKqmaoISF46
 NbQaBQy54OEe/h8wGS1XAjQlWEdmvT4oYaaVs1WB7plBARg6GNBcNTbQye3rJCKdynYh1qBPzGO
 uq2gqKEAyXXKDM4IZFc1Uuh8JALkg1MaVWYvwcSzgpXHqVWNEiM7v5DJIC87Azk+EqtDfYU+pMa
 zsvcBosMMXQbwZLEzWRwc1oyrzhzoPbI/7WoMW7F25oQxSdh+kFu00hDNbTy73OyHpi0mXk11Lr
 Z7CuSE56m3dEZb4KhvtU4TuFOg33rF7n7PQ6jjHTrTa7Ky1V2ltilvFcbxzVX/2kdJgXLsLv4cx
 qABTxRTWP3JUZc57SRGGawOAAy2aR6YOLlP7nkHdPgIWmvtjsPe155T+nniW7Q1ZIKvXWLnInDu
 sk9jSXvap9V2GFCncO0kGuaKPYQtEV05+UrEVqPYVfdoBI7Nk4nWQ8dyOJAreYz2CJz9Jfmnh47
 +ewapr9Ydat4KLQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Both of these cameras are supported by generic MIPI CCS driver.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (3):
      media: dt-bindings: mipi-ccs: Allow 90 and 270 deg rotation
      media: dt-bindings: mipi-ccs: Support IMX371 and IMX376K
      arm64: dts: qcom: sdm845-oneplus: Enable front and back camera

 .../devicetree/bindings/media/i2c/mipi-ccs.yaml    |  11 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 243 ++++++++++++++++++++-
 2 files changed, 249 insertions(+), 5 deletions(-)
---
base-commit: 3f78d2d48efe77c257284e9c7703612a1d1ec2e6
change-id: 20261122-op6-upstream-cameras-3a86034ae08c

Best regards,
--  
David Heidelberg <david@ixit.cz>


