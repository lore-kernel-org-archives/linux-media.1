Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102650;
	b=1zgECTQUiyP4Qaryq2XS59rdkNkbLUMZbsK1EdathsajgM7gEa/mg4GPZKOfbcj+L/0Q
	 fd9n6BkuLMi2+S3exLlRbki7gy2DbptcmD9ebrXEEFQAzaxiTvHzBo19ovuR2hInbWVtA
	 lCsbPOrBo3vHyeKjHb3AKJtO7OKpQOxXMQTiPDWiO2KT60C/H8VytxOwloQuj3/SxbJOx
	 ya3TMP7SOzTMDiqAR9P4pl7cT0pj+afXSZZRezaEaTEdgl14+lbkPm9vaLIwXNJf8tUTP
	 kuvwsrVPoK71Qtqh/ty1AJ0S/WJyiIvJP9+vIneMGHE5zayxWPmGdL0rvDZ9ulRkbPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102650;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qJ0UWfPYC0fYyhd9uiu3p11FNj2/gRpheMtRiGNIGRE=;
	b=IKaemaS1JVDmhMxWggFOmgX4n4dVVI9BxTvUUDIoWs5GALzOTPhMbPkUXX0MCNwVYwil
	 qzqqzspVWl2rS/Lmx5LLw9DO3RCKqgQigTPzPEiCdi/+JzobVPsfFGwGLa+1c3xjOMgh7
	 0dpUtBCj0fLWa/DQUlG8q1XkOys5DRAPPbczDtd9ldqQnynFuB59kZEn6AjACSIPjoNB3
	 WCxKaXb6zFUPwXvTvZ4+b33oi95S5fKgv5CBNRxzSFJmdDmcCu/qpXtJl+vKPFo/S9w49
	 4VuMbuL61m6QZZ0oJEnC/KYZLEW6oiLIkvq08UkUe6CODtf27Xm80VrLR1CCcpea9cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QagVSURs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4C606A33E;
	Thu, 19 Nov 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QagVSURs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD781F000CC;
	Thu, 19 Nov 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102650;
	bh=qJ0UWfPYC0fYyhd9uiu3p11FNj2/gRpheMtRiGNIGRE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QagVSURsSVRKl29TU0u8IaqLSpkaLs+1e7qC4N5tfcPG+nREMgL0UEMX8D9pK70LO
	 uA4f005sIHgZcqmcKtqK8RlmgKzj/ncKtRtz4QxOpHMMTe2FrlePWhiGjuq5u0VRev
	 M8Nw0TGK1jL6mI+x8/E1yrQ3vGWndY58nPpeRG02pG/OwUGOle8jrxPbziftAGbIFX
	 BCHpUKzBVrR1YFFeXOaN61puFX37MHqkxIgVnWPwioWY+0pTKVwotXEJ64kDXhaW/j
	 bQLDJyGvnmeZf+1KI7OThscMnBWkCazgyh+OSNdIHrTfmZixqP94XqvrLSeD4oTMVk
	 R9sAEgkH2DtKg==
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
Subject: Re: [PATCH v4 5/6] media: qcom: camss: sm8250: set the VFE AREG
 clock rate from the VFE
From: bod@kernel.org
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028132403.3505037-6-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
 <20261028132403.3505037-6-atanas.filipov@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:37:26 +0000
Message-Id: <179510264636.2846709.11683938055067241843.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=762; i=bod@kernel.org;
 h=from:subject:message-id; bh=1rbqkUnKYNw7JAsUg6r/+qrFKPX2DPdJgcL17Z3Y6vE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/xe234ZA5pEIAQyPMRYY4lrHFZE1djIqoKCNG
 euLP3rOIi6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav8XtgAKCRAicTuzoY3I
 Oh1DEACbQ9boV31/H7XdMkDa4J5oaIZT9IgOUwEH2WQmWeJFAa3dKRjqeh6gAzzAnnYYllcbZjO
 xIMkY81p3VJqJKztzWtuGWgia/jngPnx6ZQ7uCwfkl3os+U4YevloDmwEHSkrLsnVq/wQyCTIcs
 mww3ZKQjoOCx4UEDv1bNf9Cn/kUWUrGHZ0mORQEw/9o83SqweWKqZ9O5TpQwVK+j3tSMLMqL4Yx
 btmx90V2efH0CIhMpa6eKYO9EwutZcxDB9LsIkBoX8xtzVcHdn5Sb4L0X+sItRoZ0eE5R0eIP5b
 dvqAoKcyQ+qsqJ3/5gRFAj1N1LjdTbEgxGuLWjTXY45WsOwCaoxlUrnPRHwsjPq3knTnW0/DI8b
 AU+4TCEsKeAJcCBu5dOMB3mlHkPwCkTP9+aN7+BZO6aoIqBeSeIwpqfOSqD/tk3Mn0BXnz37Qvc
 xepy3Dp53MfDjc/zrbnSY+hxiZdWjSrqkSMSEH+p/j8k0DYRwvfTXHxXhRIkQy5DrKEmKL/u2xv
 9ZTQv0nmHfsGyX2SWW6pK1Lc9QQr8XjSy10bLjLOr4PedZow9A1nwrVRZe5+EHR/BCNqjdXjIzt
 QwUYpAGQdmU/KcegylJSM4BS8IK4rprU5P5WsYFyof+Hft146DTrQ9fAichP0XgIl+0bm/MxUiW
 BM7/+4tF7ePw8mA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-28 15:24 +0200, Atanas Filipov wrote:
> The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
> in both the VFE and the CSID resources. The VFE only enables it, as
> vfe_match_clock_names() does not match the AREG clock name, so its rate
> is set by the CSID, which always selects the lowest one.
> 
> Match the VFE AREG clock in vfe_match_clock_names(), list a single
> 400 MHz rate for it and drop its levels from the CSID resources. The
> AREG clocks of VFE0 and VFE1 are separate clocks on the fast AHB
> source, so a fixed rate keeps one VFE from lowering it under the other.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

