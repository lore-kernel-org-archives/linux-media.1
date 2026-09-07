Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBE3B8921
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777258; cv=pass; b=gDLapLvagLEuAJRY1vxXjG9iuTyyteBKwyOCkbOVbO3/BYdzXob8zV+ZqdBZLj1tMuecvf2udXlWMDr4D31q4tPRlVFeTZTuQpWWFZ3bxC80Xiuino0RwJ/rc/MAGskVTwW3hr+yhEBhAebMOLOAfsOA0i+O6oaNpzu7yAOOxlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777258; c=relaxed/simple;
	bh=cOV9wQIDF/cCX+cm5ZeiVTe6fT+AHDM26hXrmXiIUjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arj+KHGhxk4IHcE4opvvyxb8e7n7kDF5rWLYVh09R1ztYyKADp7hQb2aViuNgEy5Sav8mpeVG0FzsCPFw9CKh+dKHXy2sfIX3vlEED9+GwRAZkj+SSDhijonNsutVvE68ROcYAFyRDSn7CKLNC/IRM0yQpNQu97Ni0buv/akDeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FvtEoAIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1QINvod; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FvtEoAIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D1QINvod"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879gA2m2503129
	for <linux-media@vger.kernel.org>; Mon, 7 Sep 2026 10:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r/uVsmZjePsgWLF5nnCqkhs6AavpmZvcFVOMCbtvOw=; b=FvtEoAIJJRDlCC/J
	MkrxySW19P2BT1xCW30TRjTVv/1OJU4PBTnHEzu1yFUi0KPHd+c/fl4I2bvoC+/O
	/+i7dPKWPl2gvdn7fSwzOewGbuynVg+01a92qqTCpOtMLoR0egD36KWQFBUCvcsh
	+LtpySZh+6DOovKN9oC2aYf3e8GNClburVi1/IPjCSrz2RvMgV/iIdaSwCUQjrgG
	hOKExJohGSWUR9S6TkiKn8ZJiLRa7wtn0AXLY7pZgLsJaKx3efDeT2CTRLkr395t
	zOrkWzxEmvc4fvy8XXp3f0mjaW8+rTZrBW8D63qm31svbTnV+O/OBpaVFAWFfanR
	cvHakw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty07gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 10:34:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93771aa0379so696977485a.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 03:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777253; cv=none;
        d=google.com; s=arc-20260327;
        b=FPc7l+Wp+L6zrgjZYbEowM9OHxDXqUWhdM6L+TRvSVkehdtXmpNFDMUmn3bGzbQZ3H
         gtUuw0GAebWyb3txWR/6wC4f2hW0MXVlpuSCNfK44gbPqSz5hXDnTEM2SQW0MsH/QvYC
         sGYPj3wojehtsWmLc2/rvdW4wiwiPGsKJx5iLWBBRfAe/HNUWWhBXCSBGzt22wrnlitm
         Jq9C9p4YytweEmBtyvOaX6CIXYf0ohkXRXKTmX3nmbsewkeuhd2CW8Dw3Q/2EV5A8PpT
         PElZymYNPGEI9Z0z4cKOtxjyUr0upuFwXK8cPMeUGQJTYDrgk8ewif+9Aq/QUyeaN5Hk
         NiWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9r/uVsmZjePsgWLF5nnCqkhs6AavpmZvcFVOMCbtvOw=;
        fh=z13SKXSpMcSPgyr39MeaEWmnGwG/thEg8Qv0pYjJg24=;
        b=poe5slw+n5Dn5mQx8KSwn7aOqkwEA+5f0S/sqTnZb8eVrbZrDSQ4/vihw9tYuGBs4+
         HyWkFKa1Xua9SqqFAiPdH79FFfT2WXZSXeJHj4KWtI8iNgYqqypawRfR3U376RW+2lsz
         glCXX5DB+wJDpWMHUyLorjfGyuM3sfywpuUcJnHeI8TiEIG1meb8C/aUyUNKAiDEvMzn
         zbo4n6Ex1vl9IB/mjMYNoU5Tl9fCoJOWiZ6PeWeIyldXVSFG/rYKOVkFIYSqq2o68Ioq
         9bbmG9LZByT6e2b2XC155nsqtXNcTADr8+hk+UTyQRxgKwnLajhd0MVN9Ag+tk+0K44b
         gllQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788777253; x=1789382053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9r/uVsmZjePsgWLF5nnCqkhs6AavpmZvcFVOMCbtvOw=;
        b=D1QINvodY9n3T/LRTIHm8Z6D2RDnMGU1aSKipiv8hfFG60mRztQIebVhvga0LCKvTO
         ShYDZIGO1G9KvC5bLv5sj1YRJzXU3CaHAhbUszsrovphCsyUeF/Zrybn6V0WtwcA1B2F
         J3o8xHv0UNI8qw6AOJ85hp/O5m1lp7gcPnkN56geISTP1d+Y/VWNCdPV4weqBqXXcLtB
         sOx0j25HqR1Be54kWZhzk8/56xcgiBqUSAWM81JuxP80JAChGmt8XpJASPuQwctzgmcl
         VExP9u0aOxOW05iG3dlzmK7mN0ieYy/r+VoFgzv6m+B+dtVZoVGEEcvzY7BuedaH+2AW
         ndmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777253; x=1789382053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9r/uVsmZjePsgWLF5nnCqkhs6AavpmZvcFVOMCbtvOw=;
        b=f55bXnY4UxVhjZuM4chWDitPkafhYquRDrlJmefjLqARCr9WArKtgk7Mbrg+FWLYqP
         RadcpGfIU4k+lFBgn3GRKavi5gE6nK2/T79rHr+F1L/dkY2KESJ7DswKZkxaqRwVCvyp
         htKbUGM2pySibpw6XsjmHdX5AFIfotYnQsVI7OraHmXIV8n8NkCLMYxcR6ROr75C/tNX
         fpfYVXV7JcQKh0M2a0qD77NnvlgadblEduF851370QhwIoZyxJVGUWdLrEF7JO7Cj8EN
         4OVvfU9/Vca5WVT70FJNTo2HrkzIf5VuE2hRZ9fWcd8CWV4oTwbjwPGzmZdQxynFhv60
         rSxg==
X-Forwarded-Encrypted: i=1; AKwUvBwN9iUMptbV+fMlxhxRELccuPyJb03BxVaNUxLpCbLUY1pMA1PFj+NdWiRtfX21sdfQdM4wPTC01q5Zbw==@vger.kernel.org
X-Gm-Message-State: AFuF++mV0E0XnPIOxnSJjfwdJcTFBPVJHVjf0LxDbbSQFkSA248xW5j3
	mDiiRiF9dU8bgK3ysvTEYc+0KqOSxZ0G6j6yrfjXYKKzqUPSXfLATi5h3AMnZpxwXllFChWmgvY
	/R41fFkF3/hBaIxWg1B0fPhzMVzJflb0hmlvrWim3PUIo919IU2fJfhTm+eIttuZtGZtrvls3yN
	2CcQACRQoxE+9gRAjqr8a/HE8QS13O3z8czSgQIbtr
X-Gm-Gg: AYBFou21DwvMsJ+/y940Zi9qx7YiAI4qwz8xqe9wR5dLLxuctSCNZX3L3Ubca+3O93T
	bQpBkGfrsCNlmmOik8K98wEEZ6xjp/4pOmZkP/YDEYgLK+uLanniFvrmUi/dkMSxTh77UyZ+kJ+
	LBP8bsNsSTBywQtSrh19j7Lh8RJE6AMUQdoDcgcQzC6JxRcIIIdeyIPfP7jojJMx+c2QYjUARkh
	QIhrozfHroaZLVsc/7WbZwyLlcNXo9IoJ9MLP7RDR17u4MTQLec9ciO0G5n7VG380lMJC7S5rw=
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id af79cd13be357-939803405c3mr2212180285a.21.1788777252813;
        Mon, 07 Sep 2026 03:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:939:3712:77df with SMTP id
 af79cd13be357-939803405c3mr2212176085a.21.1788777252241; Mon, 07 Sep 2026
 03:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org> <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:34:00 +0200
X-Gm-Features: AcwNN1VJ8J4YWhqhgaUqy0bAcRBOnPNt8aXqk7p7m5sE3Ox9cpLN3op12T7zh9Y
Message-ID: <CAFEp6-0sWWAPdpktsEvXfWrQ=bwYM-+EZW0u3XAp7Jq9W=3ciQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9e9326 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1wquS563x6b7vDQMZpsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2cThuSyeN0SgtRWMkxQRCA85AiCX5Ava
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNSBTYWx0ZWRfX7+nN8mSwQexD
 Vau1/JihXm08jVFBrIg8GZA4RJR9SJOqBTHN413EmKlPBLAUbPBdKdcpjzpOTsrQ+WtMFfh0A5R
 fUy5cJvnyxRNTOvZ83k21CrHO18j5hA=
X-Proofpoint-GUID: 2cThuSyeN0SgtRWMkxQRCA85AiCX5Ava
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNSBTYWx0ZWRfX6DzJEg87wloP
 ARhh/5cZoLKHp3GjPTjMdftmGwqhuisufypZAaFhBWCkRK1EtIJgF01BCp/+Qr+oERDWM/n5uWM
 AnOmWU449kvWnPctQEmzvXfGHVIjU0qwjABGrdXq25LaNkD6wwMaQ9vnIP4PTvBzNH15yEpvaCu
 BEhH1dP5r0kv2laut8lQyWF7DxS+NkCy3WskizTot3+uT0Ku12z4vD0LUX7bVGtHUrgJFc7oBny
 L5LODBvSwMreUFHM27zKK6p5YQA6EN/AwEMFuAXbTLLCOTcZyh7DdJnZSDSrxVVUin0OkXRMuA3
 5XAUv4PKIEV62+SgcMewDGvViJxdrDgJSnXQ9hidSBSe+m7/mWxkSuXEFgU2uv939AOsQr9zMvw
 S6lqN23uk93G+2pJ17vehjAgErYd3wtPQhKinTjnyYC8fU1dkz3/7J4lUZkHRqOKZHb+ts9NEUI
 1JjbAcLj1pbZZTb+E3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070115

On Sun, Sep 6, 2026 at 4:21=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add dtsi to describe the xe180100 CAMSS block
>
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

LGTM, but note that there is a discrepancy in the CSIPHYx register
space, it is defined as size 0x1000 in the CAMSS nodes (legacy) but as
0x2000 in the dedicated CSIPHY nodes. Also, the absence of a CSIPHY3
node between CSIPHY2 and CSIPHY4 initially looked suspicious, but it
actually reflects the Hamoa hardware layout.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 322 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 322 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 9a854da9550c3..75366afd1b5b2 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>  #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -719,6 +720,50 @@ smem_mem: smem@ffe00000 {
>                 };
>         };
>
> +       csiphy_mxc_opp_table: opp-table-mxc {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-300000000 {
> +                       opp-hz =3D /bits/ 64 <300000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                       <&rpmhpd_opp_low_svs_d1>;
> +               };
> +
> +               opp-400000000 {
> +                       opp-hz =3D /bits/ 64 <400000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs>;
> +               };
> +
> +               opp-480000000 {
> +                       opp-hz =3D /bits/ 64 <480000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs>;
> +               };
> +       };
> +
> +       csiphy_mxa_opp_table: opp-table-mxa {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-300000000 {
> +                       opp-hz =3D /bits/ 64 <300000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                       <&rpmhpd_opp_low_svs_d1>;
> +               };
> +
> +               opp-400000000 {
> +                       opp-hz =3D /bits/ 64 <400000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs_d1>;
> +               };
> +
> +               opp-480000000 {
> +                       opp-hz =3D /bits/ 64 <480000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs_d1>;
> +               };
> +       };
> +
>         qup_opp_table_100mhz: opp-table-qup100mhz {
>                 compatible =3D "operating-points-v2";
>
> @@ -5629,6 +5674,283 @@ cci1_i2c1: i2c-bus@1 {
>                         };
>                 };
>
> +               camss: isp@acb7000 {
> +                       compatible =3D "qcom,x1e80100-camss";
> +
> +                       reg =3D <0 0x0acb7000 0 0x2000>,
> +                             <0 0x0acb9000 0 0x2000>,
> +                             <0 0x0acbb000 0 0x2000>,
> +                             <0 0x0acc6000 0 0x1000>,
> +                             <0 0x0acca000 0 0x1000>,
> +                             <0 0x0acb6000 0 0x1000>,
> +                             <0 0x0ace4000 0 0x1000>,
> +                             <0 0x0ace6000 0 0x1000>,
> +                             <0 0x0ace8000 0 0x1000>,
> +                             <0 0x0acec000 0 0x4000>,
> +                             <0 0x0acf6000 0 0x1000>,
> +                             <0 0x0acf7000 0 0x1000>,
> +                             <0 0x0acf8000 0 0x1000>,
> +                             <0 0x0ac62000 0 0xf000>,
> +                             <0 0x0ac71000 0 0xf000>,
> +                             <0 0x0acc7000 0 0x2000>,
> +                             <0 0x0accb000 0 0x2000>;
> +
> +                       reg-names =3D "csid0",
> +                                   "csid1",
> +                                   "csid2",
> +                                   "csid_lite0",
> +                                   "csid_lite1",
> +                                   "csid_wrapper",
> +                                   "csiphy0",
> +                                   "csiphy1",
> +                                   "csiphy2",
> +                                   "csiphy4",
> +                                   "csitpg0",
> +                                   "csitpg1",
> +                                   "csitpg2",
> +                                   "vfe0",
> +                                   "vfe1",
> +                                   "vfe_lite0",
> +                                   "vfe_lite1";
> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +                                <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +                                <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
> +                                <&camcc CAM_CC_CSID_CLK>,
> +                                <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                                <&camcc CAM_CC_CSIPHY0_CLK>,
> +                                <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CSIPHY1_CLK>,
> +                                <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CSIPHY2_CLK>,
> +                                <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CSIPHY4_CLK>,
> +                                <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                                <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                                <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                                <&camcc CAM_CC_IFE_0_CLK>,
> +                                <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_1_CLK>,
> +                                <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +                       clock-names =3D "camnoc_nrt_axi",
> +                                     "camnoc_rt_axi",
> +                                     "core_ahb",
> +                                     "cpas_ahb",
> +                                     "cpas_fast_ahb",
> +                                     "cpas_vfe0",
> +                                     "cpas_vfe1",
> +                                     "cpas_vfe_lite",
> +                                     "cphy_rx_clk_src",
> +                                     "csid",
> +                                     "csid_csiphy_rx",
> +                                     "csiphy0",
> +                                     "csiphy0_timer",
> +                                     "csiphy1",
> +                                     "csiphy1_timer",
> +                                     "csiphy2",
> +                                     "csiphy2_timer",
> +                                     "csiphy4",
> +                                     "csiphy4_timer",
> +                                     "gcc_axi_hf",
> +                                     "gcc_axi_sf",
> +                                     "vfe0",
> +                                     "vfe0_fast_ahb",
> +                                     "vfe1",
> +                                     "vfe1_fast_ahb",
> +                                     "vfe_lite",
> +                                     "vfe_lite_ahb",
> +                                     "vfe_lite_cphy_rx",
> +                                     "vfe_lite_csid";
> +
> +                       interrupts =3D <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +                       interrupt-names =3D "csid0",
> +                                         "csid1",
> +                                         "csid2",
> +                                         "csid_lite0",
> +                                         "csid_lite1",
> +                                         "csiphy0",
> +                                         "csiphy1",
> +                                         "csiphy2",
> +                                         "csiphy4",
> +                                         "vfe0",
> +                                         "vfe1",
> +                                         "vfe_lite0",
> +                                         "vfe_lite1";
> +
> +                       interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> +                                        &config_noc SLAVE_CAMERA_CFG QCO=
M_ICC_TAG_ACTIVE_ONLY>,
> +                                       <&mmss_noc MASTER_CAMNOC_HF QCOM_=
ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ALWAYS>,
> +                                       <&mmss_noc MASTER_CAMNOC_SF QCOM_=
ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ALWAYS>,
> +                                       <&mmss_noc MASTER_CAMNOC_ICP QCOM=
_ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ALWAYS>;
> +                       interconnect-names =3D "ahb",
> +                                            "hf_mnoc",
> +                                            "sf_mnoc",
> +                                            "sf_icp_mnoc";
> +
> +                       iommus =3D <&apps_smmu 0x800 0x60>,
> +                                <&apps_smmu 0x820 0x60>,
> +                                <&apps_smmu 0x840 0x60>,
> +                                <&apps_smmu 0x860 0x60>,
> +                                <&apps_smmu 0x18a0 0x0>;
> +
> +                       power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
> +                                       <&camcc CAM_CC_IFE_1_GDSC>,
> +                                       <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +                       power-domain-names =3D "ife0",
> +                                            "ife1",
> +                                            "top";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               port@1 {
> +                                       reg =3D <1>;
> +                               };
> +
> +                               port@2 {
> +                                       reg =3D <2>;
> +                               };
> +
> +                               port@3 {
> +                                       reg =3D <3>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy0: phy@ace4000 {
> +                       compatible =3D "qcom,x1e80100-csi2-phy";
> +                       reg =3D <0 0x0ace4000 0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +                                <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +               };
> +
> +               csiphy1: phy@ace6000 {
> +                       compatible =3D "qcom,x1e80100-csi2-phy";
> +                       reg =3D <0 0x0ace6000 0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY1_CLK>,
> +                                <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       interrupts =3D <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +               };
> +
> +               csiphy2: phy@ace8000 {
> +                       compatible =3D "qcom,x1e80100-csi2-phy";
> +                       reg =3D <0 0x0ace8000 0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY2_CLK>,
> +                                <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       interrupts =3D <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +               };
> +
> +               csiphy4: phy@acec000 {
> +                       compatible =3D "qcom,x1e80100-csi2-phy";
> +                       reg =3D <0 0x0acec000 0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY4_CLK>,
> +                                <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       operating-points-v2 =3D <&csiphy_mxa_opp_table>;
> +
> +                       interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +               };
> +
>                 camcc: clock-controller@ade0000 {
>                         compatible =3D "qcom,x1e80100-camcc";
>                         reg =3D <0 0x0ade0000 0 0x20000>;
>
> --
> 2.55.0
>
