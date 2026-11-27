Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795749807;
	b=yzcU87sEDRDfpneD1tRWDP9Av9UpbtjhrIQ7X3QOcCVGYGtQvX2p9xIR9E9LRUWORFRy
	 OSooYdLUrpJAZXv8FJALtsKZiFy+yDVKhJ8Mur6DHywi6IKuEy7zlvElldFouYhtu55IR
	 z6TFmqxdPOwhaCnTdESzi323vl9NOmdiFffkjia9J/RYqAhANsKNnZE33F5yg9c7ImrB0
	 iebX4YjIdLbSbdekSzIpDITDKKUrbVdEBHiH32fe5F5S36iTPIy5jsvZPqm8KVsPPTvIw
	 ABptOvjozo+2MWh56ITz24p0iyX9UPB3hyd47bKjJMCjhKXvmMmV30f6I9xPeGKYirg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749807;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=Gl6LXmb+y9YWFaUu737oQJJtP9Q0dpQRY6AGPnkM5TrwxJ+cywiFHNIyqqhU95BX0obR
	 KP8R4MvWqFSuPE+wu/U89zNplMEUHTaNr8NiSx4tWT/dqqwKJwDRzk99J8xpjY8mVzYRZ
	 Fq7SCAzY4gRITyUHlioLWRClijqtkJ1xaBEUt2NTjBIEs7v+p7RL9f+SUY46Q7Z+qFzTB
	 KU8KtmDCmz0Z5ds1orSkmJNIfT//XQCJxLZOu7Qb1ufBEumZRWAWFCizkQXM3LWpkLEuB
	 uCrMQ4NBOzjZ8JmNTQib+foiNKYG4xM8Khyb/ZCZhBj7VvZUrKzZJS08ZKvHWq2PyoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChdjrnbS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1D5606A32F;
	Fri, 27 Nov 2026 03:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ChdjrnbS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795749806;
	b=rsyO1rz8EXdok1QXs1bSnkRo4bGIWsCD+7BQRt5XnIWBWipuPAG6WsNmb389gbdVdJax
	 Ytp05j6en562zc5yy0TUOAlakvwcHEZy6s4kCYf8dEqxn6ZhfQVx9vIa/tjZkpjMRuCvs
	 xXMpcg69NoaiEZPooiI7iZoo9X5+zBo1rreBEVJZZ/UVCLeojGv6W31e4NrE/t6wQ+bY4
	 GKGpmNtImdDAOxn3uIU3jaZJYoMrcX9KEpiYaueZYver19SxtuFEUg4IprH6pqvtTpclY
	 7gyVKhdAHjvxwB+++tIGntkhuRvmDDLnmqWWwy0xmg5fIcpzzOIFYTYy/lJ4X/xsp7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795749806;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	b=HyJn2l2jM02VX+GFXFhSqZAkdLifFsUgBWN7RD14iRAz60jhe9RMB3qBmi/Q1xh2Lkp8
	 Te7LruFHqjKrrfqshAPwvYEiTnogd+9AhfaN6NnxFSYW3mMqARK6GpdH0XT6IgTjv2m+T
	 aN8IgeoD7Pz5s1scSeal1JY5rFrtLymppXfdEXXkmy4+gihZEGlnp+OdfbNmJb1sm3Nlg
	 hmKQK4Scap2j6pC/u4jQfte7crcUzLzQVuPjJFpzJt1uh6nK2OKpptW+K4GmYlNzSa4pJ
	 Jg/aGJLZDgBHjTxNbujJFSn8GXbSHk5PkZo+NO+1QfTr+2V36VTgmA4+BeADgiyPspw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A07BB1F00893;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749806;
	bh=3HQkdF+6GVHVhXGkW8uSp7nZNiL2SLB4UuniruSxMKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ChdjrnbSWlNi8OC/H/Twx8osfNgVL4fbbbO2I9LXMtIP7Gv8MrV/OJb7N3pmJ1ler
	 y63v3fcfkOS2wSrPnK+gkeXrk8eAWGkqikux6hKISV4MdEWIv8zkZXEpButjaMpene
	 KWDiVKTHHW3HFjlgH7tfVK8htA1EPikW8w+Xsv/W+4G2FSOCAoVR2ogIzf3QNhvh2e
	 MWej3W05w+umZ8mouX+gOcIcc1sI9N1b1ChJ9JAr3N//QJTtGbNYucp2bVnBb7nyvz
	 zA14QdBGy83/fUpNWYLZdZjRR6ZXNx7E3IHIkW90iH08WTXPj/+f4S/bq3uwZ8O12C
	 PbM+93YCXTOmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2B5CE4B536;
	Fri, 27 Nov 2026 03:23:22 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 27 Nov 2026 03:21:54 +0000
Subject: [PATCH v4 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
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
Message-Id: <20261127-a9-ir-v4-1-820209515755@amlogic.com>
References: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
In-Reply-To: <20261127-a9-ir-v4-0-820209515755@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795749801; l=1145;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=rmPAoSNSZx5LMEoeF/b4E+Q1f6fRs3+ubaclp6Z1pc8=;
 b=SDByBrBZZqFxlr6BWJd3MQAjvYPpGxvnC2xMExDusEjm2PDIELuH80jfKJiOQZapHxLDbN/JM
 +24LbZZtl4+BrMWg6//YnTn1ecghq52cSV5HYa1KUpOd/m6BQ2uEW9D
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the Amlogic A9 IR controller compatible string. The A9 IR
controller shares the same implementation as the Meson S4 IR block,
so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
index 0f95fe8dd9ac..db9387e43eff 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml
@@ -23,6 +23,10 @@ properties:
       - items:
           - const: amlogic,meson-gx-ir
           - const: amlogic,meson-gxbb-ir
+      - items:
+          - enum:
+              - amlogic,a9-ir
+          - const: amlogic,meson-s4-ir
 
   reg:
     maxItems: 1

-- 
2.52.0


