Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=K9i82U1FFAwd+n9EHuf+Z/UpU42fdf8vyp8WeE9hC8nuBUjw8rjHRWsA+1u4b1u8paZB
	 u+f1pFnzyj2VHfCuwVmlopvNck59Mt2BkSYAZ7eoC98b9FdSl8uc9NPvhEBuFdMii3UdE
	 w2LLZx5eCVmUWnNscIyoieEwWCGUfpI8dSN1nrWUk/VSJqtqz95kcGO5DZo9ZgEsEowNQ
	 t9nlWDhkm8r4THe+NaQa/vCt3WdZ5K60o2aoVkrymaAAVUvwlsTM3xdM4qmPNSkz3B+ME
	 xCLir1Ft1LCfaqBSvYLAJAFeBmIVTen204OWfFW1P1Hu/NlulVtxgUV6lmXddCgWYrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=bcPylQyBF8RsqkfVRcIVN3I2/GrkMNiMx/bJd+9OsBiqrdn916nG6gpMvBjMT4SLdRNN
	 uCG74AZwFFE1z6dfWsPEsXTdECPrnf3RB1k1vQkP50/f50jy65qfaZslSy61eFzmcqvDD
	 Hu0QAf+/yL3kzhRBfYpg1EtoWpdB1CadsO9y2FHKnvpN7dR0CXUoplKCSBpfSPrr1PmU0
	 NdsxJgL7G6c64LqD0JfH56XElTLKk8dBCK3gJqKGlNHC8jcDjuErnydvDfwmamwAhx4l3
	 jnJ/pCBDyC5XPD05uLhvgJehPhjs9kf2uXqR1CPeOEZRH5jdBAbfxedstPSlhbh1fSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924D60A2624
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 09:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5924D60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=tuT5UoBr
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so3607040a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 01:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081887; x=1795686687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=tuT5UoBraM7XADG/B+vWLbNmwJGNEmNaCzbPRSq/rt3g6pOqHbBtGLQv7O344swf8i
         m9hEtpaZN/9MqKHcbuqaHH+hQQBks9WlJ05E9e1BVwdTevrDWHUPWlhb745nVNmcB+rS
         s1Sq6aCJuYJalnpoTCtudQN169ZRKGb0qZxA0nVlyFM4U7/CIAs90tc1t2Cl6m2JvZZH
         SdmCLLRacQFAdhsKvKg9eYO4XPPJ8F7s+1Xwr9FAgLA9VlQHByko7ZkVKzBO1Bsz3jLc
         4zrq6pbkt6NZMaeUHgxPtbFH2eYoQ0qt3/Ax3C6DAaxiO/EovBzzfgu0f/zy5QMYy4Iz
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081887; x=1795686687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=I+K2yYLW0XsTkCtRDfnhaAKdUo9BrKQheBtaIih+5yP2TyYvkiWdT5PA2IYVoGNYXO
         OkWwpGhhzL3TMHX1YXCbYviTfppmhlgCKuIPWXqH2mB/AAX1fGM2Pxh9pS1Id2IijeE3
         OhHJc2FAQpXDNlSf9NTsdMcvV944OlgqiTUqbcfRJydiz5ji0AiY7dmRvOl1G4k//JZT
         NzUf6N9G6oQRZWujTQ3gHWcUuSzWDhaMxUCqo0yQ/2FwKg2BeOndMb3WLwC2PlaiNc66
         rOIDR2jgR9a6BS+EtkTkx9dhPD9F+LC7qo8yhFG0WV9OwVVIdJQsfkfOR5MPQHEuufzP
         abpg==
X-Gm-Message-State: APuU4Z9d4buRSD49/HJoknCcil9U4FbreBQ7VLqcncp5EJSoK/om/IfN
	mvfqFjEqGx8Px7FrXysqo5Bn7mw8vl3OAKELahVvttJcv1wc3aQQLNIbmck8PLA0uXs=
X-Gm-Gg: AYBFou19GC3Rkj8mjs9c0gcpY/Bb1KQyPpqTZS6Vm+jJ3gQucb3lMFsYYmbP0WukTlg
	jFizQb99SAtE495emFCzBSr6c0Z7zZ/C6nH9BwuaigSSiwvSg+xzIs7AuQ1oL6BlhycCAHCZpWK
	nldzBzLYcGr9vCPIE/lYmCKDTXkf67Iwy75U8jS1huJh6mzTh++G0GNGUe7XvP7nZmaf7HxjdSN
	QYJfyhvceI6Kl/4XSRzII4ZD7+3CUx9H6VBL0LypVO2/cZGfvA4a27tUsZDh19PPFM92tKd8z8a
	83+3Nrct2VkgSEgxng4eLeNh8/n1P7UdC38L582FKniQV4hJBHBQxuv7q/U4hn8r6y18VEeoeym
	MHJa7z70gltwyvp9S+csKTeKRXwGjUXdp/DOzhDosAvVRVoJ1vilHYR8mMJCIzAKUIRyc/eaXka
	LcB7aQ/WiJ5TSoh3cKrMavNdUDzWSfGT7Sze/NzX+dRh+zAjmVJXOMgwcjKTNjYFWNhDd3sidgc
	gABcHvbyDNTRC1E5j+PqzpjAlHjp1QFDvTEkoKC/hBnGsmw+Xud1rD5OAjPS+TBtXOyZpjAbhBC
	T6liGuUZg+f03LAYDS6Bmzv+g23DQrK9qpIx/2nVxe8IsTMpAxCiW5NSPCzwbJwAGiPxbcy/RjO
	Vp8LrDyLz5/0=
X-Received: by 2002:a17:907:36f:b0:c51:2497:c64a with SMTP id a640c23a62f3a-c512497d81dmr169697366b.48.1795081886833;
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:26 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:25 +0100
Subject: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
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
Message-Id: <20261119-b4-dw9800k_cleanup-v4-3-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=CQYSyNjBO0Q/zSTuxeXLUaV+HvnPHo1DxvGi3LDOgBjJK0F1h6E4ABmNBlYJUC/6ZLjkTYYtZ
 +LHwZi/bm3XBFa/c3yFLbAkh37pXvffc998eC7/JZuRzWEqRvCwkvKu
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

