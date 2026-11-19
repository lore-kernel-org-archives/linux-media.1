Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102540;
	b=iEgtQ3g1HQsafbxeCMWv9SFwFKsDOG4Vt9lqJocKapMtZJdLgEQZBhN4b8AR8b2XLEOs
	 WJKQKpbdubB3HMH3/VwE3riCqn2n8eO6Pva9LnzYLVecNHs8X4PY070SwLM6Xr3scPjPA
	 N+FDrCIDhOQg/BLzjtzba2d/f+F6quQS3eXWFx39zrPNn7ns623oGR0jCJYukSwKcEaH7
	 aVc0dBRvcABBS43NwZgp46m8KFpur6SCOkvOOWD8NwvXKAwphn0g1eIbPKbS6DRkKfnF6
	 jEXRkeWzv9ckHrwmsK1V/aoq3/0s7EyB/XnU1u3/odgmfY7o6AQrXy29nd3srCqiH8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102540;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UeXDYRBppO46yxPAfOxxsv3qfn3han8/bDVYuqVzF74=;
	b=n9HUKl2rvlXJxk1eWrltk2vFW+05R2cgu/Ly5EjnMZgJ4IEc33PtwZDgTLbD0naSZYi4
	 JQ7Lkm4ISMoD5cqY9LSmPYy4DrHHYhk/TTV5rsM0Wp0IloHj6J8AIAF7b/m99OcDf5GYg
	 aZGbRqSXLAepaeGZQ5iUz+/ihnwBRj1ZaKhnZpUlTG1RbDc40TGEvn0Qs0K1V8V6n1mKW
	 /5hrUERkMixC6zntcBf5HOG5uJCmGXba4FLWLEU8AR8KsVjO89eN3ZJTRg9TG7HLnxlxh
	 wgDCvQ85I4gfBa3/xLICUYngxshCE7r/kkVTFcLeLnXvkkixALqm0IzpUTLqJ5pT0tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+8HXcpg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B13606A33D;
	Thu, 19 Nov 2026 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+8HXcpg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3B01F000C4;
	Thu, 19 Nov 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102539;
	bh=UeXDYRBppO46yxPAfOxxsv3qfn3han8/bDVYuqVzF74=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=g+8HXcpgP2YojPjDP1+MAQosOl0ajQiv+vGix8PMCsmdpT+EbWUj63X+fiapXZfH2
	 K7Gw0dLBVdPIax7E/vLEYXn6HsVJWdBmQ0w+pU4TpTlQfIsyD8uHUSv/5N0NL0W6nK
	 i6CSi9ASQtr+anRpiWcCy2RB1vUVT0mZOQxY3ZlTC9+/ZFcCFCA9zD/mJr2u6mCnL2
	 yn+rPN4kXhKZSeDyg198LnZ8T1ZIHFqEFuZsxJZ5fj7GyBpqap3j9ofFs5cK7Fev7Y
	 0HlhxVWQDBJX6Lv33vsmtB19R3n7LtC8oOQfp/euy72hwkQ+fjJO5KalbETUEIjTEp
	 ExM1OpApaOdsg==
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
Subject: Re: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to
 the highest level
From: bod@kernel.org
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
 <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:35:34 +0000
Message-Id: <179510253465.2846709.6572974352841900681.b4-reply@b4>
X-Mailer: b4 0.17-dev-e3fc9
X-Developer-Signature: v=1; a=openpgp-sha256; l=909; i=bod@kernel.org;
 h=from:subject:message-id; bh=8dYBGYzl2S8liXZhKSMDIb8+flg+1yILtNCpaAexLDc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq/xdGK/lFe7bp7sHjMxtOBZs8ExCA3f5bsnEkh
 lt22sy+x0eJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCav8XRgAKCRAicTuzoY3I
 Oq0NEACk7hlps6xySWJtb7EVAKaeGpHTtDUTwocUhBhSe5HKqt+BVw8ZQt/LyWPIF5FIat/RwxS
 HYmJEvLaP3+e1q2cTbpRvyy/LDoFyPhDwVqjhRwFHpep/CjV6J+0KHnRYVhkS/Pc0Fgleie3GbG
 wMlirdMYH8FA1Jz0m/n1+yASUaL36UpGk3A5huLtLy4eayXgu3rnDjYjKfEvjtYGbA/B70o+9aL
 OdjWrsNybHElRw/1GYevagFcSONY7l2tcFm0yYuegojobhVKeZlCSSPZR1AH3o6jZ4jdzynQe+8
 pWpxOtfhzVjsrmk22lqFZz+ixLLEM7K8BXy55jlRnT0ZXzOk6cqGnv6MbKd6Le6Jch4xIoMXPRg
 sc4jd8vwWHlIuQC/ZfHp6Ny0U45P02gCeI1cmHUKxNZiU3pMOYQag6jfgBittDvTZLoCtCfvjig
 ZB5xzLOT17v8qTWc+ulYFCUQak5ZRbmXVVY3ZG3SzlxRxkdidoqmbZKWbiMDiXg4L6rI/I45Dwb
 RETeZcBHIUwiLKC16SKEJLiidbaqJceX0OUa3nuRCcomDwAcYyslaTVeZ6H8LL0Pv1yCA6AN2B9
 vwpKhCsHUcbTDFH9M3WpXqyOpGBewtk+Zlm0q+6CwTAfzo6UVDx0n2/pvR7qVREjZCcmOkZVRDR
 qyDuenZvLtGWGpg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-28 15:23 +0200, Atanas Filipov wrote:
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
> 
> Keep failing when the pixel rate exceeds the highest rate of the VFE
> core clock, and clamp the other VFE clocks to their highest listed
> rate instead. Take the clamp into account for the other clocks when
> another line powers on an already running VFE, so that a clock
> running at its highest rate does not reject the request.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

