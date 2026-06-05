Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA93B8D7B;
	Fri,  5 Jun 2026 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780623159; cv=none; b=tVbH4HnL+ZbqXE+xz29IbOJkbuDixBPqyvhDaRlLVxhSQQwjoTZXQUdhzfTbfU+vO+5pZo/4RQByJhYgSUehezFgEeSYNlVFeKAhJ11QNxWG5IYN6hFGj10f1THGMX/UoBSbdEPwQA+pN6x0RQ/yKvzi3doB8HZwM+odgisM/ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780623159; c=relaxed/simple;
	bh=leE1B07djykPaRhj8mXmnGpYg32G0G6m9WhK2NRV9Iw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/WVExN8Mqj68mItVgD7f3HV3u43A66+4OOzo2B/UYvt0Y8mG5+Y0x8kNqU+5qwTfBXr/p4Jb4N/sk85RXgWPIlG3seGN0s+0o/gRQxBSGRu5jMjQM/eFdKWrtLnZobIOyyTCMvvc0N9hiJyun4vXpnZaNL34K3u5TiIm7PqLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=r5+a1itU; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="r5+a1itU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1780623150; x=1780882350;
	bh=vE5m4fyiI3/1Zan3K6q26LRwdwRj9i1Ec1K/KFXubZA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r5+a1itUWeFpAlAm1x8fe40HiVewAvPe+Ux5riI6Jc4/a7qcZsMOgCGfZEXJkXdpP
	 UW4KmjHINH8FOCrBxAwuqF0uG9Cu7wsP36p2RjVCGFq4FoaaHQ0toRPrWVlhSuFADc
	 EK4NPFPAEMgJbah6quunq+XyXHkqO/PgtplfvTU1jJHq7/EaEEvPBvVW9ZTKRJ9Hx4
	 JtcOZD/cQFdHBYgd1Ly3zl8MT0xSK5z5M8EzMcTl94fM8ukd9vp5bTub/J/+vm9Ckp
	 /I9aTREok6w3496Riw0PbcJ2KpsnN6sIUd2+k47w9/UJ1K1wyqKtEoEhxqvHgsHZRw
	 BDcnfk1/rAfzQ==
Date: Fri, 05 Jun 2026 01:32:26 +0000
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: milos: Add Iris VPU v2.0
Message-ID: <jQoquiebCzuUA_8ZWojMt8UErp2E9QRpIpYMIFunJHtaHjDtKQgMTTxaOpiV4qSErYDPzL7N4c5L5QrYxP2TAZF9WPwiH0QhepIeKsF9vjE=@pm.me>
In-Reply-To: <2e4ff886-af8d-b9cb-75f0-ad9bc081bf9b@oss.qualcomm.com>
References: <20260529-milos-iris-v2-0-7a763d7195ae@pm.me> <20260529-milos-iris-v2-3-7a763d7195ae@pm.me> <2e4ff886-af8d-b9cb-75f0-ad9bc081bf9b@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1065450ce33a2890f1ef40c1b50d2173904eb964
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, June 4th, 2026 at 2:01 AM, Vishnu Reddy <busanna.reddy@oss.qua=
lcomm.com> wrote:

>=20
> On 5/30/2026 2:28 AM, Alexander Koskovich wrote:
> > Add devicetree nodes for the Iris codec (VPU 2.0) found on the Milos
> > platform.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  arch/arm64/boot/dts/qcom/milos.dtsi | 85 +++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/=
qcom/milos.dtsi
...
> > +
> > +=09=09=09iris_opp_table: opp-table {
> > +=09=09=09=09compatible =3D "operating-points-v2";
> > +
> > +=09=09=09=09opp-240000000 {
> > +=09=09=09=09=09opp-hz =3D /bits/ 64 <240000000>;
> > +=09=09=09=09=09required-opps =3D <&rpmhpd_opp_svs>,
> > +=09=09=09=09=09=09=09<&rpmhpd_opp_svs>;
>=20
> This doesn't seem to fully address Dikshita comment from v1 =E2=80=94 I b=
elieve the
> suggestion was to update for the mx rail only.
>

Yeah I misinterpreted the review to mean "replace all instances of x inside
required-opps with y", will fix in v3 to only apply those reviews to the MX
rail.


Thanks,
Alex
