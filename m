Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795396914;
	b=XvNhBRtT1//WfmlQsBJqwpp0nYjKV5kmvLu90+cOdTcdTmMkrcd7cv80a58DzDsB6ptc
	 yIqp6PRNDf31FvxuSMvpfWHuGQAn9DXWeKykoo0bTxXs767t8MSAV7kIpW7rPGvT9leGS
	 4Ix6EiELoqiGH8TlrA9NO5KlR53PGC/zN/h1A1W1r4etIu/TvgkmhY2rOu13E9mJ6FGjK
	 MazTRYF11UbY5YiyAi0k1GM9bmxgw27WJH6bGKj9mExMPswWjWDVPLxxEh+dcC9bJ18rc
	 fRNLyxpX8abBwHwelkvsMx5Rh8/B0hIZhdJRYuK62m4Rer/Yk6RuAzEwFJIKrl0x5TA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q6bkxdikXUOU091jplOGu0mVELvYreTq+WLXYzThjD0=;
	b=cECIru2J4IUz6GhdHTediExJHlz7hwoVLV/PSPg/35bFHQz8Wprz6M4miCA1VdmjXO9M
	 X5zOK9TV9stCJbkizKqobNDVs8rw4ZoS5TlDckYhyAHfZKpPBmscXhBxarXaxDAXTUEc2
	 trFX3Ctqm4nTvfpnRi1iXDsPB+6lJZR5mFOJrG5NqRmPBIG7evZz7g2SuotQQps19ns7v
	 uTGh+e23nWURupr/q7uSnDjTa602PLAGsT94LkwpT1OuXTjc1ZoBREKAxQaawQrWnQ/Rr
	 rJ8mQ/l1YfpntXFAmKRKrpjqQPbtAkHm0T1SAYnROXodLzhOm+eK3aNiKRV11kKHOoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BrkSPiKN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03863606A31E;
	Mon, 23 Nov 2026 01:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BrkSPiKN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795396913;
	b=AjfeZY49Cj5m7ZxE2+qqKEBkm/YBUHxR7Ez/RSvH8oHoRCfa89acWlp7eGdCKkyCzZ01
	 uY8CyIk3NCz4U6HYm/gNtV7dpZbBQUd1mmcsy4eSFk2MGaGYaT+V0iTak2l19gBF+EbO2
	 EV2+k2UFHC1rrDvUhAUuxpWCcCxXaZm6HMVZ3LseYX31K1pFiR/Y1bPRrqL/SUSXIPvpL
	 YDabMZO37w1GPRLjFcwX0O5sZVA4T2iFIW4PgdQwjysAfny0d9AF54JOn+Zv/L7321ere
	 Mx4/h8FOkwtkABYzemp1/7yyxNyM9PWjklA+TZf3u5TglLI20Hmdr/mRiAUIbRuNX8g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795396913;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q6bkxdikXUOU091jplOGu0mVELvYreTq+WLXYzThjD0=;
	b=Owrcaw9DDhmHYrkXt/VB2Hy8cfZFUxzpSuC0Du2NNmrHFmSlqRleJD4/oM8ljHb3Umn/
	 oK9PCrPERYGJhQGGjBNKZFvH39b/iWUM4lX/XtKsLeYS7gcXn8oqzuLSr0JWSrNIeDIiK
	 qZThhPYMUrETn+8Zw5Rh5GHsLWMGtpV8RAykxfJniPbdPng3F4gwvzKgYDCzbF583e1Pm
	 tc4FLh7mJmPu+uYoAa9Hx/X5iKJ6RJNWH+xbi3GPKYG3fWHVFC3649ZhK9lfy0X22FmFi
	 bMmZmZPu5g0DPFC38R33ADjCiU8wQJN4vu70T3LCs13m28WkWB1BWcZIHe6L5e/6uWA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 535DC1F000C4;
	Mon, 23 Nov 2026 01:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396913;
	bh=Q6bkxdikXUOU091jplOGu0mVELvYreTq+WLXYzThjD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BrkSPiKNDBMOYrtIYwcJaEb5W7A3baOgF0KzsyajTN2tXoJHcuUevSX0JktuQdTem
	 +DZQvYpQ3cOF/+FDrPSl01153BjfFoukgmN9Qa/D3OD1caP6xSnNB/kRn+zUg/DyfW
	 jRrkmSBCMjioRvfnoD//o4G2VHwfMWck+RiOU9HEa6Twlwq8P4Uqz1sm/cffrKB+DU
	 NG6/l/lLN3xxE2gw7XTmxnRSM88pSbjWDX17pCKi2Af+ql9c33bholOsAlmOptqDFP
	 upLS7RfpjKDAhMwDoq2Z7SOEM/bVUPMhi+tjPtn0LL9XMmW8n5PbZNzri3jY9o8Q2z
	 Vn6ymM32nxBdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CD5A04C2B6;
	Mon, 23 Nov 2026 01:21:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 02:21:46 +0100
Subject: [PATCH 1/3] media: dt-bindings: mipi-ccs: Allow 90 and 270 deg
 rotation
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
Message-Id: <20261123-op6-upstream-cameras-v1-1-234fb3b7bb18@ixit.cz>
References: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
In-Reply-To: <20261123-op6-upstream-cameras-v1-0-234fb3b7bb18@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YSUwepiSqoDBtH0gFw4KuC+ySgKsZDWDkOBfiJm5ygk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA5UvX/SGAmXo0JT1pG6AU93lHHgkXbdX/cFu1
 Z/7eHbu23qJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawOVLwAKCRBgAj/E00kg
 cuauD/957XAku1JmXT8/JIRZ7RCPQLy2QmCNk9ti/ZOfy3pSPdPPKCYGG012UlwuBiHOStfCZBJ
 46ZsNjekrayuExMp64gMbhHOduU6iovOu0xv2lcsYCO07xQ4pb7atAnc/tCH/MQaGqhTt+dQMu+
 fRhL74yNvaWUr5KKWNtM3kjl17e0qDDNrKPYRFMoXpCR7kXkv/pO1YUs7lGbNUy+uFGCNDeAjMy
 FOjbsb9T8Mje87A2NQn8o5CssOWz4CVJjMrnea5ZuZ6fIUYcrZpfP9znlMaZyqlY4dVl0KoTrIz
 6hbdyJXn7aw+d/1BpF9mYpoKgVUazsZ30EeOyM20E1xgWSG1LPNbRW+RCn74x5i40AhHKvA2VLp
 99EyqCxDz5YxiBX4K/eFUgP22mgiTb1x6UGyXikZSQBzwqj5LirVdoWihyg5DUQckMdPG1098xH
 sywlQ5oKa50qSa7HQVSPl9IHnxo9KvIHv9K3jgOQuTmmOBC8HWxLkZD9rTrms82oU0h/3BejZdj
 OXz1kv43IAHctA1luk13svQNlL0O9U7j7pC07wLVyTVCpleL3w12LIeC7kq0gggq5hesDZjxEqv
 mM86STPj8YAi8oY3ISg17kq0HbSHWSb/qEwW7aHQf3ynN06tRAA9IrbJF/veLvvAMqTFvxiIjjC
 Ugh3oCoIFn5Gp2g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Driver works with it without any issue.
Also allow orientation

Fixes: 72aa1c5f1d0f ("media: dt-bindings: mipi-ccs: Refer to video-interface-devices.yaml")
Fixes: 72051783cd73 ("media: dt-bindings: nokia,smia: Amend SMIA bindings with MIPI CCS support")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 217b08c8cbbd3..44faa2f613f37 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -59,19 +59,18 @@ properties:
 
   reset-gpios:
     description: Reset GPIO. Also commonly called XSHUTDOWN in hardware
       documentation.
     maxItems: 1
 
   flash-leds: true
   lens-focus: true
-
-  rotation:
-    enum: [ 0, 180 ]
+  orientation: true
+  rotation: true
 
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
 
     properties:
       endpoint:
         $ref: /schemas/media/video-interfaces.yaml#

-- 
2.55.0


