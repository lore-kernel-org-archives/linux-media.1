Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E24963D4
	for <linux-media@vger.kernel.org>; Fri,  4 Sep 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525567; cv=pass; b=HFFFr2r537X1v2dxrHr/+h1UPZEc7ZOZGzYO/43WtwQfJXYZQdKvpi1W53DUCX6hntnBt+kMyLFdtfFCGEoq228Grb1nidqLeC26bTkmkHpb3KMl6Sk/wdtNxC42J+aovKzPtw/BLv3JXRCvpnaX50l+ZfODu4Ta5di8gHht7/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525567; c=relaxed/simple;
	bh=VUcBB0vOW6MkjtjLDRFaCy6FaOEhAXU/YjiYrkHQqRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYbpMRsuQ8BRwxSLbBaNVIm13yFdEtyrhAUuJFlKfsKodwREcDAfjb654SWw7Pdyj8HDqw/58YFAkVrWrtMt1t56gnVyGg4QI2iw3V/zpQSmIlUDS/SQyCcEC6mdpK+VePrf63grDQ3TSCos7gC5AwF03jLv1ZFUxULyDGo1nHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0XJ4tXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dZjQ0lao; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0XJ4tXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dZjQ0lao"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AI9ZY2616015
	for <linux-media@vger.kernel.org>; Fri, 4 Sep 2026 12:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=; b=K0XJ4tXGEidqOsXZ
	b032oR5V1rqvQce0EcA9gAHTKUvpdP1vfUI2NvqJy9w/gP6XHjbadQgX9dOh+sH2
	U0udof4CD8CAWQvCHepl4wCV5X3ApQBfEkUitnWsclRsnOxoVB+V5GMzJ++6e2Re
	3mQUMOjyswcZbavDWSMq4x329nxo9nfG2K4bI5NTW7pUROmGarJHDQX5Yx6XXn7A
	hGQSNZhHyd7cmP+Qf4qbuxe1qskxzB/YsHswpsfOspQ1rDXbM/FcVJ62NSaVpeAJ
	azWw3CIV/wasFEdMSeRe759zAFUe/X8vfVoeVM2jXo/U5ZMfaNS//ACUzGzVRc9P
	rLTDZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp3gca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 12:39:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f52ccd459so15088341cf.1
        for <linux-media@vger.kernel.org>; Fri, 04 Sep 2026 05:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525564; cv=none;
        d=google.com; s=arc-20260327;
        b=G3wZ5/3/8mT2uvT95fbfFDAiu0fD5HOhxiKB2PRTm8dxQ9M1IpUR4h6yp593RbmkgK
         Y3MpZ5TKWMrOLkAIfGq7VpgRXjk93iGcaWlsHcFPwODy4EoQrPHNjqBrcurJuKLYSFws
         GP+/+wGKCjvH36KUsvn55paWoCIrxVkJtPvMlNCohvFCBI7Oc2tEC3rFwYvi/MKMsYHU
         JOa3tWGyqCIKztC3EOkNNUTdDpCysniCVFiivPOaiALT9c18QTHAWPt3L8zrp1XSxlmj
         LTyQQeH5DsITzOZmW4w5Fb5asoIz0593a0OWXqECv4zP+qQD4vj+kSds9saIukKCHt5o
         E24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        fh=NeZ52RtNqClzZ8Y7zST+fpdz5/44osOUiJZ/O4Y7dCQ=;
        b=UOshUb3tqIFb3bq7H0qUMCEpnG0LRWY3muQmjs542zOtp6P63RPHN3PmamBMBJlJ7/
         6/BWg5PREy51Xw2QD52es1C2Xcpylp4QqQUQD256XN8IqLybAZbwyAYWNZywYSg8IJiH
         XYjlYka5lEcuDRKq1lIt0c70g6dVQXNqF7+n0HMz/S9baQ2mMGELYu95Ncu/CjS5glaS
         vT7tWoadhj1BVG4tK0ScUvcZgc2ul8YW4eBkfC3n0YF7+75WSqIsHeSzawde2DdOSLqm
         +kUMPCLQyBrG1XnzhlkURimVIIAmSP+z+kGzmvbY/zg9bltVxS8LIRFyduac2PMzB4pk
         hCcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525564; x=1789130364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=dZjQ0laoM9Ta1Q0Qbe73TE3soEbMO8AuqNJWzlEUVAGQEhu5gZuF3yQPWsNDyOrxVe
         PrPJBqyNtc4N55b63pmrcyD96+DdSIyES6aKFsYL1YvnN8udvoArZpmkjZR8NauIFsud
         oSS4sRYjR6zyuyipIg9LtFiPHw6mHByxiDQn/5DVV5SgwbHluRoi8o+VtLXlEw8Svgr/
         nllI3usBR5Pk3K7/029PzmETjejT6y9vJTURbhNvs3ndE2E1cpvoqVaXy6SgHOmdDaC1
         VhNWjy8rboQcbu1I0mRRE4yEYh1B+Hh1OU6+DC0Bz0Y5a/jb1mlU67mWt5weICq2eMFT
         PV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525564; x=1789130364;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=ImY1FxYmGm8PcFlStpJduCiVKNJFATzpJIqTVsQg6V/0U8Ba2qZfY43PkYV6Jkon2x
         YP5AjjFL3CRIdg6jjCsVMc93WmSzOVSn4hATMpRUz/Ka8prVp4JbxZA83gm8Rc41IWeU
         dwYYrSKbPPivPQb2hINaw5yIpiOXAfVVvtq+QeoXFqtNdowpM/YnpswtyMn7F3EISE4e
         wcLjHZWsVfoIR/o4YW6Y6zwMsMspzwS4Ctqm5311Wc4CieX7Dfn7CI+OmVt91QRePBrS
         pu/fjuvB6nRsmC0HP9/XFqeSoiY5izqsedw/9rmk3zhl/K1aU4KlHLdsxGsw+VPfAl1i
         4qAw==
X-Forwarded-Encrypted: i=1; AKwUvByZve8qcGnfHjK0UCJI1GBYI0MfnEB2kLrQgNSAUnjy2GNiebyAXan2fNty/cotNaxoJAOVtuP/KsxDWw==@vger.kernel.org
X-Gm-Message-State: AFuF++lpgrCHwVsiIIeGZouLVRcycFRV/A6Ul+FhSWn8ZMH4HyfRLJP5
	+M0aZdvPE9jCIUjtTNIpW2d//43IzY0GWLlv/yUnnn1gohKO9tv7757Y3i3SJJmWvEFw6Ly4R5e
	hBDgWZN0HqSoJy0Hhc9H8RUViDSk6e/ftcx8BHrJSXCPHYK7x5erJJPFq6N+XdfORejp6Ct2Iyt
	owRCVILTXovQpQ2m0TRYtGyEZ4mWWz6QqAz1rH4iAG
X-Gm-Gg: AYBFou2iqJu4KKsL2kHF/xpzW/XHORMX1BxdDO8szmRbSOrObj35y4bfveapq+GHwRE
	2LvCz5I5iRjMxLhD/9GTi6CVE719pzSyLKDgPtDck/9ncsyhmdoYq4Q+xBn2ycSSvIDgoRAPqdD
	41sxTlJIpM9DtJGerxFFW+mQWj2wCk8bOE6MjdsUsJNnh027h1ezblnlrkHE24fWmLLJ5efcf3g
	BdP0D2TxKlGyG2gLH9Z6QkGj3IQ0XajmFJtZYOnNC+cZyprKTxKe7JGw6WUN4QMRnIVdvp1J/Ms
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-530549fd6c2mr61916261cf.36.1788525558775;
        Fri, 04 Sep 2026 05:39:18 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-530549fd6c2mr61915361cf.36.1788525558050; Fri, 04 Sep 2026
 05:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
 <2aXo5I_5YqQ6uikqbIOWs7L__EwJV2oTs24Jqa-YRqGIU2FOT1O4bixGBbTzbaiBuENyW0XkWbqAJJQnxgSnWQ==@protonmail.internalid>
 <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com> <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
In-Reply-To: <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:39:04 +0200
X-Gm-Features: AcwNN1Xi0ZnbHcNu1xFGVtcHdZiZF7hrQekcNJq1YSDgANQhTlSn5NmxIbSBScw
Message-ID: <CAFEp6-2_XTMnxqcoNFwu=BfWki2U7U=iuQL8n6QcR-CZSMsX-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zFFiX9nRfzPrp9p4U7viNPVj1whvWUe_
X-Proofpoint-GUID: zFFiX9nRfzPrp9p4U7viNPVj1whvWUe_
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9abbfc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=4B6qI-Qak-9ifnyKK3wA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX/hkfKpLhcsjh
 87aduozsrBpKVO9jDreqgGpKNlIKYGNYwFYrTIoEjyAJR/aEzKTAxoojP1ngqa6ZF7YhDsqj9Hk
 COnIAi0WS+L1nsfWrL924JluHFJ15/JTgGayaQrGyUR17oNwXZDLNbg9xwfmvKiiEn+6N5hbuUy
 wZUKU7+Mrzh4EzSiIAGajOALl4eUCzxc1jqL6SSAXWqxJcTHKTVrSCmCvJK2ypmqslS6lMYDqbB
 Tp9N1ZHvWAudL2DduxH0zTXv1ADwAPcUonSVZaLcNlD43tlHsJxCmOVKJRx12uIWL1WHEanO0yz
 rPmPSHWctwzRs0V3uUSNDjhnYTG4Vr3ckBVISVHpnWOXFnj5bJe2sRiH8DWxXZIhfa5OBTIqXhB
 FMbg3tFN4R8LVaEy094Apnh5WxvFTL4sFVM2yQieXu6dTshI4XT437exY/izszsiJC/VSWpJKNZ
 hWmYjxYVRXimK4xq8SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfXxGPmcsOyxcz0
 2fny8GWfQsByXzZbu+5obUNu2A/LHK1E3l4akYAdEcaUadVbR2szO8kXk1zI/NgENmc72bApG0c
 sVp1pQbYvoDUE9SWjvsvLmZ+4tGA0EI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040114

On Fri, Sep 4, 2026 at 11:41=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 04/09/2026 08:45, Loic Poulain wrote:
> >> -       mutex_lock(&phy_provider_mutex);
> > Then, now we're moving the responsibility to the callers, maybe we shou=
ld have:
> >      lockdep_assert_held(&phy_provider_mutex)
>
> An LLM suggested the same thing to me but, I thought the resulting patch
> "looked messy".
>
> Do you want it added, its only three additional callsites.

It's only a minor suggestion, but if you end up submitting a new
version, it might be worth including.

I would also probably use a scoped/guarded locking pattern for the
mutex, as it tends to simplify the error paths. That said, it's mostly
a matter of personal preference, and some maintainers prefer explicit
lock/unlock pairs for clarity.

Regards,
Loic
