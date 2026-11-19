Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102725;
	b=d1PfTqPduPGI5pgOoZSSSXHeuqYoCrK39PpGx/CVudp4I8Ol1NUXY9gG0ax2pZfy1pBV
	 aUuzbrM0l32YNXxHi/dwxU+oZR2iOgksFJZ1v16b1mP0CmBagkgzURzxhEK0NLSuEwbhf
	 extJIzivKCPZi1TNSQg6I1pnyi8RIIToHfebfssXCL9hWMQuzDhJnmUdpWFPjd4T9Mr3x
	 yBYutxBB3nlNcXK0ZrfUWc7DkFqpbF2Wzf0L/t9BTIio+lS53+XTyvVmK0pmHX1jNab26
	 DmWGA7GKYunsyy0TIihec+SdrXo5z+RbVhQcq948Gk/khKSAoai2DGt+yp7X3IptSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102725;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=38Sg+iyeqc6KBqbypZKVLEIJ0XzctRN+NIq5fG00TXE=;
	b=KY7y9QteyN7pUvGrnCqs3q7OyQyJMtuIF64gJFaT9ZVvvUM44r9RDLzzlqugkWQp978e
	 pWJBSYounoxyk93oEw08L/aKktPvkuHtAr3HXR/TBevuIEUzg9ap3eDoeL2+r1uylHOru
	 drqbKArnLYNbNvWPJiLDoiKc/WOOhlefYd9yieGigcm0NZx7nTIXhkmvV1YuHcP5uKK4X
	 khhOKEY2rfx9UvcR74L0lX7CeWnJtMoIgFn5b2NxHMEEVKsZ9QmetWnop0LcVRwCHUm9d
	 EsgQW0pEl4P6T24hflcE5ZZz4iNQzyIEdYs0le1QD0oR2B26ZUCJTkE7fS1cnVXxhuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdtxF5+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9177D60A262E;
	Thu, 19 Nov 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdtxF5+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08141F000C5;
	Thu, 19 Nov 2026 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102725;
	bh=38Sg+iyeqc6KBqbypZKVLEIJ0XzctRN+NIq5fG00TXE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XdtxF5+bO4nTBqs/TOhiQo2zNI9dB4IiFWqsvjBz/06hnwva/YggJIH5rskOKEcal
	 PIKHD/PygFnXUhlPlaBulKFxQcaFAEdt8nzkrJfNom9h9cn68QY48T1Mg6ahOwUnNo
	 9T8Oo0gJadpPNX5bgm8qPn3Ksir/QAFfhDmkbqh9XXzRyqQizQI4ARlRM9ChN/W6lq
	 me3crgRW9TR9JiAYJAyf0/+0YZpoVyKs0aK/9A5hK2/P5JeetVgLbf3jLrGXsYy2yQ
	 OHTEBgE5fwVAl8n1/87FmcOtkHiTjJvMnYLK713bn80mK/BIfGq8P/HLoVG15UK+1E
	 Mn0ebwzIBH+Kg==
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
Subject: Re: [PATCH v4 6/6] media: qcom: camss: sm8250: set the camera NoC
 AXI rate from the VFE
From: bod@kernel.org
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
 <20261028132403.3505037-7-atanas.filipov@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:38:41 +0000
Message-Id: <179510272121.2846709.5296245274382118751.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=bod@kernel.org;
 h=from:subject:message-id; bh=cmwL7aX52x4dm1pGfpUUyGqb0jQfa7yy4tQDAGjcRFQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/xgBP+XD3CHvLbZNvQI3StMz0CNiDHGRnK7iB
 RITCtpXPVKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav8YAQAKCRAicTuzoY3I
 OvgqD/9Le25BP3oAnae1CAJ9wXdinZ3Ov84nJhxp7kPtZtqehAP4HAoyvgq/1BZyIANWKAhMDoE
 SY54fJwNNYKMh5fsa5azD7ifbSMKn1K2ZrSfxEl1ZVYsMuSvEnACYWpNqdue4RCyxjRKVTjLg4T
 oX5TeOBGBqYYnJqqr2HoH1hYA1OmNTYWz200uZKbOH/UVH55MvnvByTMW74h+s91ma/ZssbRbvh
 kW3/bvhNljWaxeJwc2f5nSUlh8GPc2IZLtiJzi8pcM5VoIZ36JZ9miUUUHejTRixtLJourAF0td
 2O66w5Rx6h8WIsSRXAgDaf3b631UEvjCEkfBNEw9itaOJ91o/TFKVlfUCnLhLd3BQUkEzRBNspq
 WCpUTpgJJ0RY64taejQYDqwocg8EXrXnP0uZEn4aZ/IHAqtVHoTj1FqrX33tB6li6Ff13HclpCk
 jSVceaP0AEyE8ExjKA+Df1m/S1tj8WQtvfbsfspP2HxM4Gl5a8+iJxWP+5WZU3NCJvJWRboB7CG
 kzcc6kkEfciaWuvLdD8VjtNe1jxilWK4VqbdcejCcDtbA/vBbB9YC0qNuGVnrLsss52kVXy/G51
 fTFWZZHuaY5Y3uNdTWuJUf8bZXq3naNEHQ6GxC/DtNaQ8lQSfu+SiiqQnqvJAErjmgEgYeyVNKN
 Vco2XNS1sik9PxA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-28 15:24 +0200, Atanas Filipov wrote:
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
> 
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share the camnoc_axi clock, so it runs at the highest rate
> requested by the running VFEs.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

