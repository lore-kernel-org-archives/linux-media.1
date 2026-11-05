Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793895499;
	b=vNeOnlUIIFM9oOoONrfU4lV2AkcxjK+MSNNp17yeb/urXRu1AKtKz0tzBHK7TOBK3M/b
	 YVjB0sxOo/Z6WEdjiQPEiIDZGDx7GkLwDIHs0SwK4NdLbi+FxBTgpyB2URy93kiAHJDOV
	 wUd/CrkrIIiqaSUQkRxW1eiMv3ZEp1FCSA8Mre5IscDntWCejCh1sL3nYl3pMFVrGCpQP
	 ikVP6ciT8dk+iW+woIcBWPsaUlLMt/nF2db1LzzUr2jHhftEHSFbilvkQ741bsPn6QiKv
	 vCzatOnG8wySYMtp+85wnO/6bMFgnLffgwc+33ZKBXN47VD66DfI4ApdWhTgNeUbPUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
	b=0rNqoQugWR6PcRK5mJJT4j3jRBwohZ4qv6kXDm/4DUVy65yCz/tRD0IrEkpUz6NWvMPN
	 qvGRuwhfO4e5WbAupvDzvrz27P3yy4nxuwy7YiXsOvv8dZlgtGeXTeeVd16zwDkdGc6JL
	 GcJ48RXBkL7mVq2cJDmpZTkxtIZSn3bYrQKUupkb4SdHQHKcdFGo3S9vUtDuCPfhonnwd
	 nQExXIePFKLAxMxbUsm3M4lSzrcpPEO0J7xOQl/9Ic6huOKa2ao5pQaXZisDStMMW4FSy
	 BcXk/ND/lUSgZhH+GkDSLWPUS9FnERhq6PPedfXUImE3jtAH4CdzAt1gdsoCPF2g+Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLPOlPCd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1BA606EE9B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 16:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E1BA606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJ5E9oPf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLPOlPCd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQHsY1630961
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 16:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=; b=TJ5E9oPfEBfB/Uap
	OuMLttHgoJ+Ljst9nb794fGPdkaPnHil3RfUJcmQvkWZSdqnuC9jeImWBkK/H0v5
	KBldy6ubniZQcXsBd9AK7iC3WEOr4dOLVhm0Z4fG4SIbBuKbiMBrO+0WbSbx9vPc
	a+G8Ecljd4M0CkHKJW54TQYVbtdoXJL2dc+0dxz76RuCwN0k1uGRZ33XrMxhJUSV
	TrX4X0vpYEitqqlmkeAwy8btJ/eQI/bZlMRhlURrEgFkNKpKRuEpXEX743unYEnz
	eygLe3trZZQ/pV0ZfXAugabZdM2QQSvm4QQSZRA1RtJhGZx0Vi1m1sk4jMj0+tmA
	0uPIUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaqargm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 16:18:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so393455085a.3
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 08:18:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793895493; cv=none;
        d=google.com; s=arc-20260327;
        b=h+iTJaGsXYgA1mjac02BtOFo9s4KoGeLp0/Q5F1HrrXj0bJdWa5WB7cLntNBRV21SW
         SB+15N3xAcqrdZUp6FeRbFV3mNBMH7tFVTf8bJyCvYNF1eea1YeP19Rs67A9GbkLwmKe
         FBnz2lAFDxbq26PbTclW9oGXq9+U/tiZID+aSqYfgOjDSZvfLTYkJzoDDuPLVU7M6Vvq
         bug44nukl5cgFlOqXscDtl5Tx3w6SHRrTzbUr+mUH0/Wp+rRwwJwSVJJp0K1chzEK62L
         ylZNbQNoGQ5cVFEkHIqqLSOL+LbcQWMRPxPrpv4pKX1LZo21xE/Il2Ec0GxgVw1SFcT8
         XDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        fh=ycSlgZfzT9uWh0o+Qx2vMShYCYIGHL4aTL/4LSkgPWs=;
        b=OgSxGQj+pP9oF8wDiaWyne7VtI+kzq/JpZl8YYlEkzukYJJdEyBqedV7a06augdfIy
         2M4zH07345Wj/g/CKTFqnGLLf+dL8ewMrFR62DvVRSfBeaNtbfCp+sv15rRm7OApRgAa
         61XWNuUrXIIot9BJD9/7fzoiwNHzvv1AzZQzAwkt2Qw7+ELaiIsIFQUX+pcPuuiTFyRs
         6gtMRbMYb1rnHaLgxEsrUfyXlo64KU/oDHFg1EWgRk9/dvADgRvUFviCQdlY+fksBX8/
         SuCrLRURKwYG9fmKjXCk8qIk9Dd1Z8HeWhDo01rWQ1cmDNH5OM4vrSPHd4J2KE0iHudl
         Ml+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793895493; x=1794500293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=JLPOlPCdzYubN8z7qVwXFTQGG5r5+xKrIwkM8eMRTowP5H8ztJrITKjOY9se70m2Vk
         MSslQG5WG9qvjY991+X8yuBrTSwG4FMYpxtB/MJRDOQ7HI1Q4oAn+4/IpGDaQajdRbWA
         drcflPaHwSOBGGHxakEtmgb3h7OZwsp0VOFvEC+o0eVqqO/pNcjIkrbwxx3OI7JzEzEk
         4eJ7ZpjNHQLSa67JYjdwJE+guQU9HzRP5SzmtxPM1f7XxUU4/Tq+J5oe+MgnhGI9NbqX
         qkGbjRExbRzB70l9PccFUsHdnky1YHkx8Y64Vo4zFIhvaXgTp9Yf7+/MHeu1GMPSf7iw
         bfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895493; x=1794500293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRHcpy+QuInZ54+gLRy6pbFgX/XCoJIbTY8h+vC2X0E=;
        b=0UOXevp+yWFbn9x+BVWGFv31po8TDbinwaFPGGSLtsP+Ul18XnKh02L+kReJA7N+U6
         j67jGMhFIwxSF7B0THoxRd6OolxvxkaITXZXG0vmKv29o8IXZsZMpd4G1p9G3t12mXkO
         CCtnLhrIA8pDVH4FUhX8AKaPGXte7sCrQs/Uf7THhbzH/D3E4aePeZ3uhCS1gkVj4AII
         cXnW+FrheU6hzW7MCfjVRB7uDYjpJxRecHS0JYzgU6vCWst/xNQrYDLIVkAyo9kUEbUB
         /o9l1wHjLvqY8CDyHxhAeaWpn1vK2FzDKGgRX928ESZqU3HFd83pr88IZCAzNj6+/jnC
         hNeA==
X-Forwarded-Encrypted: i=1; AKwUvByRNEvB+kB/n9GPufIOuiwabX/t1pcY6otmC2pWkWfY/FPyWx/7ey8ejHiW9F1UflLSZEtsDc1QAJawUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hWGVpiyCAMllji4qEumRH9/XI1lusVNjEWoFyV8lvCehSp4gF
	kLvO3UySrPxUMMyN4isp8QRPKJ4JgFmM94xiHshbn4+Vd5ONNK5vAVfX3znEwh5W+kd8gPuqx65
	WyrKRjnzXFyugoHDxXu5A6MfINR1p67Gk9p7/DgmLt4WuPAsT0e/+P1xJXsvP6H/hPuAnzt+95k
	1ZyzGVp2uYQLemXdCrR4UnqhUCn1ZvSFV2IGf/QsNN
X-Gm-Gg: AYBFou3RjTl1y30t/q/v6YOH7l8u1Z8Rj+t1uHVMXu3k5zqmzoDdc/xSYgTf6cjRBba
	pa26FlexX78QUJQnkypREPphta/s3Rcch6M3WnBDpRPHbmcWonXND1zoB5iOSd0ahefhWoGsrGF
	ESNmtcOmrXxo4n8OJZyrl4Dt0B3oYQ4KO57+3DNvt3+TWzgHHsGaaLHI0Eg+SSkrzoZeAdXYU+s
	JabRmc3vzbeG61UR2b0ETfNuAp26UNAN5NWJ5mmBrxG+YoOX7QznbBBCcwmKa4yGN5TI5AQX/U=
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id af79cd13be357-944217942dfmr3213719785a.55.1793895492368;
        Thu, 05 Nov 2026 08:18:12 -0800 (PST)
X-Received: by 2002:a05:620a:3183:b0:93f:26e7:844 with SMTP id
 af79cd13be357-944217942dfmr3213713185a.55.1793895491627; Thu, 05 Nov 2026
 08:18:11 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll> <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org> <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org> <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
 <d586b7b3-675d-48a8-b0d4-564e571ef69f@kernel.org> <CAFEp6-25QrLAF=-KgGJ-rC9pDpGa2YgoQAMKxU-FoByu2CJpMw@mail.gmail.com>
 <1db9bf48-01d8-44fe-8dd2-7a3c84ecc556@kernel.org> <CAFEp6-1fSPP41cVFmu8=0z2xibDpHuH5Lxrw7W_rvnt+Fw9EpA@mail.gmail.com>
 <62fba00d-831c-44cc-8d3e-083a95abfbe8@kernel.org> <qKk3s6LA2dFNbAVvrsOlf17dn6zizSiyVMf1rJNQOvkvLGxswT_81cDlITq0atMX71Sw0VZu6u9WHK0fS1bzIQ==@protonmail.internalid>
 <CAFEp6-2_opRq3pj6S=2nDFxXBv0waeyGBKSxp3t8OOe6vvKcoQ@mail.gmail.com> <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
In-Reply-To: <3df59469-e665-4901-b4b4-512604194ddd@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:18:00 +0100
X-Gm-Features: AclHuK8YSQ-kFGWQeNw5tClylojuV0W0oBaKhzme8TxRz7tVIdZ33iLLr-iQkJ0
Message-ID: <CAFEp6-0keBgVWbBPCghkxMQAQeLeOHW8By7sQrqhjSGtJaZmEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: mqH7vmfn2Cavc7hIN9S1oO9zwC9OqDAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX/XpsoCapPtld
 RL3hoL2Auh7QO2mXlT467Hdpebq/7VuEdUsDdbf+eM4fzctX+4912gzuEy9q9D+J/vlLxrdJKON
 fMYBRDzy0Z1XTnRWCV9iT5d792H30qU=
X-Proofpoint-ORIG-GUID: mqH7vmfn2Cavc7hIN9S1oO9zwC9OqDAE
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aecac45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=oudGAjWChX48PZ3fjK8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX+9HuxU0aPfsA
 fnT/a1m7f5dDVpjldBwqzfSBF5Zy2ecjRH+xAY/FfF7BxWJS0cWGFR1RSLgQ+ZNcGEgy5flrqE+
 nFeZdhT3+rFSj4L3cg4rdc9vyzMMB/ibF+ohXF0nSzo+2+ovvRXtEh9hBMMV5NtHoNxAuJeM0P0
 HUN+ZesL5LpbF9ThWon47pZoagOTrGDkjG/3FPUbPN2bXD4AWN2Fhp0BeX9QnaPuOq+vLGeLE20
 MaEc4XN8fOQOv5iXuVDiJQB5sYq80sLBP34buZkEBfa7VRTXttwbwTeQM0FzYnObxMwSowohmEY
 qa5zO1Bh1ZFMYqiIJ0G8ueBjHzUzrppkTjUhuJ+R0WCb9cTdWPGp+FdjyPDhXAN3A1vkOXGwGDb
 43NdadjLSi1J4so29Uom1Dpqorajov7AHI+LsNPTZtcbVeDTXhtVTjCTldP6g8PCS/MmeMF+PoX
 TnOK2cAv0zcrtChs6lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050064

On Thu, Nov 5, 2026 at 4:46=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> wr=
ote:
>
> On 05/11/2026 14:01, Loic Poulain wrote:
> >>> The CSIPHYs are connected to the CAMSS input ports, which can then be
> >>> multiplexed and routed to different CSIDs. The mux identifies its PHY
> >>> inputs using the hardware PHY IDs, so the CSIPHY4 is identified as th=
e
> >>> CAMSS PHY4 input. In this configuration, PHY2 and PHY3 inputs are not
> >>> connected.
> >> I could not find that information in Glymur HPG, but maybe I looked
> >> wrong. CSID Wrapper lists CSID 0-2, not 0, 1 and 4, but again maybe I =
am
> >> looking at wrong device description/interface...
> > Yes, there are three CSIDs (CSID0-2) and two CSID_LITEs
> > (CSID_LITE0-1). These blocks select the PHY source to be routed by
> > programming their PHY ID (PHY ID =3D PHY index + 1), as defined by the
> > PHY_NUM_SEL field in CSI2_RX_CFG0.
> >
> > If the CAMSS port ID matches the PHY index, the port ID can be used
> > directly as a routing reference, which keeps the implementation
> > straightforward.
> >
> > Alternatively, exposing logical port IDs such as { 0, 1, 2 } also
> > makes sense. In that case, the driver would simply maintain an
> > internal mapping table, for example mapping DT/logical ports { 0, 1, 2
> > } to PHY indices { 0, 1, 4 }.
>
> The media-graph informs which PHY connects to which CSID. The
> port-number in the DT really only identifies the fact a PHY input exists
> - it should be considered a mux in front of the set of CSIDs with the
> media-graph being the route.
>
> Since the route is runtime selectable, the media-graph is the boss, not D=
T.
>
> You can try this on any CAMSS device right now, PHYs connect
> independently to CSI decoders.
>
> PHY_NUM_SEL is derived in the driver, not taken directly from the port
> number: the port indexes csiphy_res[] and csiphy_res[port].csiphy.id is
> the hardware PHY index, e.g. port@3 on x1e is CSIPHY4.
>
> More work should be done to represent the fact-of-life - the mux. This
> was discussed extensively in the standalone PHY series.
>
> The ports being numbered with the PHYs was a consequence of the PHYs
> living inside the CAMSS node - which we have the opportunity now to
> break with and should.
>
> Port number in DT should just be a linear 0-X for the number of PHY
> inputs. Which CSI decoder that port routes to is still a runtime selectio=
n.

I think we're all aligned on that. Point was not about describing the
runtime muxing or routing to the CSID, but rather about describing the
CAMSS PHY input ID/link, which corresponds to the input of the CAMSS
block (MUX input).

So yes, we could argue that the port ID itself has no inherent
meaning, but it acquires meaning through the convention we define,
since we still need a way to map DT ports to CAMSS input IDs. What is
really changing here is the convention used to describe that mapping.
So, for Hamoa, ports { 0, 1, 2, 3 } would map to CAMSS PHY inputs { 0,
1, 2, 4 }, while for Glymur, ports { 0, 1, 2 } would map to CAMSS PHY
inputs { 0, 1, 4 }.

If you look at the mdss_mdp ports in glymur.dtsi, you'll notice that
the ports are associated with their corresponding INTF numbers, and
interfaces that are not present are simply omitted. As a result, the
port numbering contains holes, for example {0, 4, 5, 6}.

>
> Honestly I don=E2=80=99t see much value in continuing to treat port numbe=
rs as
> hardware mappings in DT now that standalone PHYs have landed.

As long as it is clearly documented in the binding, that should be
fine. We will need to introduce a mapping table for platforms that do
not expose the legacy PHY numbering, or otherwise derive the
corresponding information from 'somewhere'.

Regards,
Loic
