Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009084;
	b=IFt81kIo8w8QK3QL0sv/5f8EiYVVU0C52d+GCIVZ0p+x7Yu9AacMECSrvOi7FUEmy4pN
	 12TEkCl3sjl2ufAMhMSiiX4D6s2FB+bf9eTLnM1cS7pUpLLSocgsSYD7eYbT0g+hnqqAJ
	 TCUF88rq3VaPaZhjXBwFBDFNncyu/OexTXTSRIqbfnPkxpO4yHJR8lKt6UzEhbZn+f2cI
	 yX1E811c1beOoAeM8Oh80gc2Alu6vEAyqg02pkOm9EehZEsPe/TbcMSotlRaPPN3Az6fW
	 emq6Br5gZOzrgI2KTKL0FBES8MPqjmuNSPfxPZfUyjGVdKhBA4Fs4jSZtZkkp2cu9Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009084;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KFMxr7an5tNIKPbCe3wThekzv3eRib5vNm+X6SDA2co=;
	b=YoIkO46VjDjRykcv617kuPLklV468EZfmrynyiAQVqckttDab3tE6znqGP37nTzD2UhU
	 X4dwjLnapzkcUt859KDiA60TzywFK2XmmpFP1/u5MGGIWHBFFUU71JgyzWwVY9dGfytq+
	 40Drc/ItVo5s/HEbuCZbfdCqsEO5u43M+KwZFk4+IYHYTs0md1tHcgvjGjqhRI9oE0XH2
	 wESVnxfRnmXnS98lZlwrbRuyEF89cZk4CvkIOpJ7ZI7HyFXFA+HRvyZlaJgiaXpHLTO6Q
	 n/05+y3tUd1LQvB4TGbMBgpT4LVaOJ4u6kbbE3ftpdYWV5fTUXpn/05Ylk3lG+/SWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWQdiUXF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD8760A2601;
	Mon, 26 Oct 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWQdiUXF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0BB1F031E4;
	Mon, 26 Oct 2026 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793009083;
	bh=KFMxr7an5tNIKPbCe3wThekzv3eRib5vNm+X6SDA2co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWQdiUXFHi6BRp5+uRvy4vT6gb5MFB3TkbW+n+E/QeU9GMbl/oljUHn7kBTsTK+UX
	 3zuqiVtzQnmQ9bzCtC6MTNYg28RLIeB+NU1/P4E4QBNQN4K3ldp4Trj+X/MrlWEU0N
	 /WmXEubg5cJHRFS8+csk6tcHDzw4fATen5Ym5+qgDU8NuqSgDMLt1Tx/TwRRcQD61y
	 Qk0OYQl5HHM3EqKBfT2+UdYeTLQw2ug/4UUlhJi6UYwKYNPL/ZghSF4eIlGLb5ORkO
	 68wn2WCLkB1fwnHjSiXwJg8/B8Fgv6PxVAVca36V9nZbcz+5A+7FRrME0qOMUvRiHf
	 AL4BbTCcsyNHQ==
Date: Mon, 26 Oct 2026 11:04:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vladimir Zapolskiy <vz@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Waipio
 compatible
Message-ID: <20261026-saffron-hyrax-of-performance-0dc6d9@quoll>
References: <20261023163057.775917-1-vz@kernel.org>
 <OlcKP8HHAIXkRzYX6vdMrXfEbLNpOVLfNZytB-qiRopju0IaQ_xxKo-mlzphnAO1Pdg-y8mu0lcw0UsQZC0ZuQ==@protonmail.internalid>
 <20261023163057.775917-2-vz@kernel.org>
 <3dd8d329-a25a-4afb-935c-311cb8ddf094@linaro.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3dd8d329-a25a-4afb-935c-311cb8ddf094@linaro.org>

On Fri, Oct 23, 2026 at 11:43:03PM +0100, Bryan O'Donoghue wrote:
> On 23/10/2026 17:30, Vladimir Zapolskiy wrote:
> > Qualcomm Waipio SoC has six CSIPHY IPs, which are compatible with Hamoa
> > ones:
> > 
> >      qcom-mipi-csi2-phy acec000.phy: CSIPHY 3PH HW Version = 0x40010000
> > 
> > Hardware supports up to three different 0.9v level power supplies for
> > CSIPHY0/1, CSIPHY2/3 and CSIPHY4/5, but there is just a single 1.2v
> > power line VDD_A_CSI_1P2, which supplies all CSIPHY devices.
> > 
> > Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> > ---
> >   .../devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > index 1f1e2a4993b2..2a11ca7c7d11 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > @@ -19,7 +19,9 @@ properties:
> >       oneOf:
> >         - const: qcom,x1e80100-csi2-phy
> >         - items:
> > -          - const: qcom,glymur-csi2-phy
> > +          - enum:
> > +              - qcom,glymur-csi2-phy
> > +              - qcom,waipio-csi2-phy
> >             - const: qcom,x1e80100-csi2-phy
> > 
> >     reg:
> > --
> > 2.53.0
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

No. There is no such thing as Waipio.

Best regards,
Krzysztof

