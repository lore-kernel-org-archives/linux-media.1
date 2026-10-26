Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006727;
	b=eqIWu/GT1kixZeuWAgZSTqQ/dPMkp2jNO7VdTs0xp0nPmgf23osStu64Yxu3otB2jyiK
	 HqJkl0EBdk6FxrI7sATzXlI5fze/8TNpiZY0GQWoiSuJoGPOvUGZUIBDDll1ED9aYAB85
	 DLgERxx7ldcj5gWkG75sjEBY0TGiCeZlVNGQ4+jdIhu/HofbT0Uk1ffb1feZuM1aZW1Ui
	 oVFJA5AgOZyXj9G8q0dAp4b98L6r/Y9qBgi17B7t+Jk19gPFkdiREEcMyW1PunpKTtB/k
	 tvP3KKOHrgST5h6vyIQndE3vgrz2hrh4erpPOEG02iZorqmmC36N9RNfcRgv/SuHCug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006727;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=neal1959JqgEWou8sGoT1vgWhum0hw9FeMKlI6YLU5c=;
	b=Qv533Mlv0ygi/KLBFgyT+T828E1nS+pG/K4NCcJf0G8NDovP9fymDjHM2QNlUBhzU9YJ
	 Yyrtc5+hckl+NjtaKEv4/a8VQWzmSPPUnpTh478R04ln4g4DpEGftmn5XfBbOybHda5v+
	 FRBRS1z4VQJGBi8Ed8p6AiN3wTtbhvjrao7/UVIoXHeUn/U89IPsvn/4pFkNzeYwMrBF+
	 mdd2Yi/+awF6Jahj1XCV8FhNkq2YPcDH1ptklFLk0fz1t1x7Sua3x4PP4aNTtZ3YlM76V
	 Cv6Vbc0wUmV+rkz0mKpyRNkkUf6RfWhdIBWltB1nztEKpfllT37sV6HCjkgx+bmVk2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=J9tfiFXB;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686B606A31A
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9686B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=J9tfiFXB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793006723; x=1793265923;
	bh=neal1959JqgEWou8sGoT1vgWhum0hw9FeMKlI6YLU5c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J9tfiFXBdHnS9yXgU6FBFY1bjpHOJP/cTWUV/Z03uGDF4BZMXjebFI3y58WKFjVDG
	 PtSWTqGpTZta8ZEcnC5akkI37V3H942KHRZh6qtOxX4Mg0OHfmnQ9De+Aqtxa06cG0
	 okEwQC0PMCvRZiaJgN9k2LgslCsAOajwN+NBgDg5ViWgKRXroqVq8TGr5RbqdNpz+n
	 7NLo7nv8Mp3KQLWI29wsSSjzL7/gQv3CUC2tDUGbBW/sI9GTgyJn5vzZxPN9UY0969
	 saXbRRQaEvqOfyYAip2mamg3TzKVVOXlSqROp7/fgVIom5N7HEh9W8SmpA2j74W57i
	 aljsMp2lRtkFQ==
Date: Mon, 26 Oct 2026 09:25:19 +0000
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Message-ID: <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
In-Reply-To: <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: a1ae12a058cef00e2bf4f9a74eeec8a01593b2a5
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
Content-Transfer-Encoding: quoted-printable

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
>=20
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share its source through a clock domain, so it runs at the highest
> rate requested by the running VFEs.
>=20
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>

I suggested bundling in clk_set_rate_range() to this patch but I believe=20
it would be more productively and correctly done as a wholesale=20
replacement of patch #4.

The point of your patch#4 was to fix the framework, which should be done=20
I agree as a standalone patch - not mushed in here.

---
bod

