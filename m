Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565171;
	b=X/7A+wFdtBFaZOsVURDDZp9DtOAbkLYppXPxcVMCmqA2Ay5O7GEwUMPF56HTGwlvpmGQ
	 +GsSXZeJB5guxYEDQ7no5CBQvFkMb8kqx6q20OrQFZigBraA0YhqMH22DvE8PLwA2zvXG
	 G8uqPJ7aDmyeZZE5Mo7q3ZOjEVpE0ngM1g5YTDGshRF/6TU0e7MB5pOs3ELOH1+vr/S9g
	 eZxGfIeaqS9oQ7D8ulCvr2vTY5+HAMBnKSOqImm3PKGL9onTVoPU3rLyzxC+DJT9GdtiB
	 Y0bhzcSTjW/YR2w7V6pV59M+ODZzml32ji9ShKfYcPcOE8aw6uYY5GVYEoOYckeuJ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565171;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5RD/LDrhJYV1tIXcx9iH98rmCrNKiWejyJ8h38BVvNg=;
	b=mOfSNNCb+Lo8EcPR2LAHA58jNgrvy2O8Yrmf3g3I/V8Q81DRaH/FLi6DsYiG9jlNy7aY
	 ChwnFMW0rKjkwO0MASHUVUkeotIQvrkdXIUD6FmaOWOCRUeMzuzwdpPrt0+w+oXNcl+fo
	 CCZv8aHIj5wmct78UMeBwyYKm52jzcM6Ck0ZP3X5U8+1GFlqilYMT2FHb3Hrxbjhgfuf5
	 nwYb6S03frgRtXXq6HidGPDQmaXUxM3MCeLomDwNr7jA6EMnRSF3Gn1GGso03XnS5aqpa
	 NeUW8t0r6/m8BCOTa0XAJ0q4l7AOYtXlVP+HmeHCDrW0Rr9XEu9hn7WwWkOBKCfcKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UV+7t0Ek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B26A606A31E;
	Wed, 25 Nov 2026 00:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UV+7t0Ek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9941F000C4;
	Wed, 25 Nov 2026 00:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795565170;
	bh=5RD/LDrhJYV1tIXcx9iH98rmCrNKiWejyJ8h38BVvNg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UV+7t0EkEc0udrKXP/qDf9xWNGcWWunrIeaflI04+fDcCnh8I9Hs03aRyj1q70jdg
	 jbi9J0yMzqwJgttLtzgglpf1Z6Cmu2F82CmkUMIBpqBxZ3x4Gz9sMQxq2Hu6rl2lPA
	 GwoqOFsGedKnoAgxbs9WCdVPSTjhO5MsdaLXvM9s1GAobdHYFBOZ+jM375oZ3GdmUG
	 4rJ5sJvrbtGct8L2VQzTrAFaT6NLWR4nDDUMKZrT2GGabHETMtTZC+H7Zs/IKck2n3
	 Ba1uQw8STOz6BiFRtJx4xu35Csayi8T239QGTd1RJwKEvQsft/vNCoE3OKtEcXFcBc
	 zg19nVIeceC4w==
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
Subject: Re: [PATCH 2/2] media: qcom: camss: vfe-340: Skip the register
 update when queuing a buffer
From: bod@kernel.org
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, bod@kernel.org
In-Reply-To: <20261124-tfe-fix-irq-v1-2-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
 <20261124-tfe-fix-irq-v1-2-fd9840d952ae@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 00:06:06 +0000
Message-Id: <179556516603.3759718.511354966534459212.b4-reply@b4>
X-Mailer: b4 0.17-dev-cdd92
X-Developer-Signature: v=1; a=openpgp-sha256; l=778; i=bod@kernel.org;
 h=from:subject:message-id; bh=dzYDuiK9hXq6k5DvdvgJjH+tK+AxsI6a3S1l5Z74qHw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrBiZuO/AemmYrhuiqd5zc5IVgv5ZDXQr28LRIs
 2M9BrASqjeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawYmbgAKCRAicTuzoY3I
 OohgEACxqE09HUr8oF7tR0Zc9KOfl9RAw79E4DOy2JSZ8Q0wZQjnM1GQ8bjyVAmTv/iO7Inki/6
 S5YVMBtX1YcQKnmaLSJUirgswpp0cfgrjrfXjBELczPCLEC+49kkpPB/DLRyqKY6stOpejh30Fw
 dXV5/MAp/p8ExudLk6vOcNS+U9ZO7ZVQFjti+SsLpAcakRk2JYgeqyd9/oyijtJDvyXLj+KJr3q
 eUzaNcxq8JSav/aTOPLdoOLDUQ14md20SBSDNupNLbBqCIvksGSdOLUD9KlXseayDfX0d3vJPrL
 nid3uvpiDTIsgZcZ/0xcTr4IRz6201++NgCaMnQkWnjuJkKug3eQ1NvwPT4SJgM62LsjRqu5lZu
 zxXTvkQMLyjvtuhAA5PSfuDBFiX352cYAQNMsSUPHDtuIyPfLW+FSpIF1RTQx6M5LQttNXu2hXG
 En0N/ntO879BvuigzvWALreOHr8Kql6fFiVwzQu3edBDamKLFz/88e2UTsgM8I8sFBy/N83iVOu
 ZJucXfT7nL6moXE9eoV5o5CjOY/xAHzpjdVgqHFipmDD/JcmbpggB+WX0Lbnb+B2kYUC9uOUR8K
 U1pMH2YC0+80jBPTGOarReVB+60KYK6jVeJRnp6DpV/bW8ZOQd973Yiwr0Mn+ObDZRImdjFkHxr
 goV3m9Q9WJZoDcw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-24 17:47 +0100, Loic Poulain wrote:
> The TFE bus image address register is a FIFO, not a shadow register, an
> address pushed by vfe_wm_update() is picked up by the hardware on its
> own, with no register update needed to latch it.
> 
> The register update issued for every queued buffer therefore costs an
> extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.
> 
> Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
> falling back to reg_update() for this generation. The register update
> done at stream-on is unaffected, and streaming now takes a single
> interrupt per frame.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

