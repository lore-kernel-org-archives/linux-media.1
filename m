Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472901;
	b=yyDpDeQ4n4MrV5UhVBCFYI/ukAJDztO9nAoL4KVhWs9W56E+Mq/OG6D42FSC3eGl3eXE
	 ZKu2Y7xC9sA+AQjgRVlNDaAe02clLhp2AGG1HJvViH/vXr0fKM/PYiDJ4Q7IhePrlkhDC
	 M3N+3K0yfyaGcSD86fvaZanCq0QxRU0V/ibEzxfUeUbbMyeZf3IQKhVIGyeXuvjm3eXdv
	 KW2HeLzgt7PnTgVt8Z2sm6wE/5Ub6N+D2lnrC1NrF9bGyzlt09HPbYvUbqNP7pCc+Ryej
	 mcvrq6ywSIHGUPaco7Xa85ASGA/v6sYnBl8/rC3fCrdyf/r1X/1v3N+xBb1b4fmueCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
	b=Ni2RVVXUUsr/4SeBBTAWT4gqumSLB2MMKH/UW4ZHyhxb9EcFrG0sjjz6BGyylU55UQ+k
	 f0HBZ4kQxiCQYvNpO9J5A2Jr40T1eXLqMMOU3OA78ZCuKUld41p0IwjaXtkFVhCqtf46Q
	 xYbeqdGbYWIt+XA39qAyNGTQzJdO3j62pCLIMcLVzvzx0uot6pi0g4KLnMUqQ8JkcJiMW
	 YPpGlRFWk+Qe/WWUZVPh4bG0FkBUxbOGtGF4FDxWxNIMg7tI8W1ldW+GIGOkhQU6gaYa0
	 PaNKVfr8BTfayHqiUSBddX1jIewmihr5S42aNRBwtb2VQ6Wz/m1GMFFyuJtIfHSCYvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F0606A89F
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91F0606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z1EyHatP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QSbfauUd
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4lulY3893074
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=; b=Z1EyHatPMaX6ot4M
	5BaelCJrRQBd+u2LVmN2dGGoww9GhSfxC4pxfVKHyIPiGpGwcf56oTe0MoOYljFd
	9wjeyMWjJl5zFsS3liVBRb88lub0WzOQO9pJ6IeQudSufKu+s2GkLStWKWG47JPx
	nxwW6BBEhyBWjQmURWa6VZLhM+9N+JHTP6RJhMinRXLST8AkykzcqyqtNsOrbWgn
	3TYJCMob73hywpYSs8OxcR6c3J3YaaKvnsMWhwb6pqocPZltWtz1/L9JQzup69S3
	rz3HqftfJ96lyRFyt4QE0C4aSmFJAwip11ItdLAT1yADCQwzhmP7aJkeUfkwCOsj
	hkHJyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re0s9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:41:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so1000378785a.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 00:41:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794472899; cv=none;
        d=google.com; s=arc-20260327;
        b=EiFbkoaOAuCU1z0Qg3lZMNMY2l7tGBvSaPX2ihYfe2730w4zqu+XSM4qtsR0VkoAVS
         u5ObIMViuWeGesdAPqs8xbn6e2uTZD45FcYSn2XMKVulLPb5WkZsoZdCtslrx9+eCkBZ
         BN9LddOy+MmakykIV3E7hsg4i0CTeAwDxWq8UQbi9vYsBsOM1KZiqx3uI6AEt3dETk/Q
         4wSByQh7XENR2wMIwzUWVDzUgIDGm/ovNs1iDsn5G0zq7bfYMZS1ddtbOLDepaDNTaUA
         nYevNoJIXgKs7R5T3r5ijBZZMBN8kCthn3WnbN9Aje+5rFCS3fH34esjWJb3D/hSf91k
         NVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        fh=oSOcF6JegCQJsE7SID/ll4EFELOmAZrtTY8yBpmwdkM=;
        b=dbRjQjaim4YAb7HwPOjqqKNcelgpNAFCtymQCLNVPu5ur5LNthp2vC0qrrK2lb38aC
         ZiiB3D5/3dDTa4v6VY7E2Y1DqlQisa9NzgHU6Pb1unmMGVEWXF8rR7nb8N4UdPsJW9WA
         lzoWJpm3u3+neEmpwHIMLJ8nkCccOciplDNl1VhaA5Rhh5eCNtIzjiA8oglxF15WrBMc
         OL8PPcR6W+Y5IbMniB2bxrSEwdqFuuLZOnBsTdoyAc6DNhtSCrqPccBEF6mmMkBXn0DX
         etcpCbnVu2beyuaEfR7y1phLgfs92pTIkwZtVcxwehSaWmUkq9OozIJQazLSKT5jSHm2
         UqaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472899; x=1795077699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=QSbfauUdtCbpBF2jI65s5xT7yk1VP9ijV/S86M6erAL2zONUDbkXm4+GtE+PhvCKwA
         IukOFMcWT2PyA3TRr6LJ3WRBqp2frNL1gfO7PHGNHRvjjtV6EVnus5qMdhGZtcYb9jzT
         udorb6Zihc7Q6sQRYJyMy7uu2eIO2Wa02l4kUgQeg45MN3GsS/TEZT8LHAcQstQaXq30
         vJ0f+zorzW2TwRncZVrFE8jZEbY7bkDJWgM8yfaiUjQjNJU/JNRlFD/3OLyGFCsmN3/v
         8tqvzD2IxPcr+onC3ZCwFA5WioPe1hcWy9FeeYsYqhaSzOnI35HYEtxYXXUVKZuWqXI0
         4Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472899; x=1795077699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MOVCx9PdrviQB3rgdWVaSwH94I9OOZbBeSGMzFF5Ik=;
        b=xa+65TAKWH9XcXMRwtSL9olOiUh4kiNXhv/D87LmLRsLvcuVuv8L1Q5bsyEtmdW/K9
         DmuY1OSVIXNMjO3qbiaRcF3V3Aa5pYdM1uhukTZFAG9rmbDEn//wkztDkqPFcTJd1WPW
         WUbUNcAi9MsShw8iW/YPTIx/z0I3FXfrwaA5YZ5Dp9qPG3T/DoNow9vQXrNVSTHqp8it
         0g8qOWY1B9o+TWqajLT6RTr4k7XS7A6ixt53taoplV49ThgyiHjqYb8UxN8ffim7s0nM
         FZulxLmM1zayOmACGXECNjVovTUmo0rMRpFxli0Od3JBXE3HzRy5+7NOm761kuDOcb6X
         4rqQ==
X-Gm-Message-State: APuU4Z9ozg9Wfk9TtqfKDfy+toUhT+aJ74oF8uDN2ZVRAuBRthgSQix6
	TFSEd6C812nCRdlkjs7BmRyMba1ACEsxrqGdLQkCJRMk1aXEo87WXaJFVE4Qa27JdG72k4pxecV
	yZ0sNBNHnjlHlFDFQ0GZrdLibxukyk8nIi5/60uhO//7e/jhTqirM5ZoqqdNePG/ypoAkcsUTiO
	Eu8lZB+T/Lrz2rJRyPOSVLg6/UQ9RLXZJMdZGt9Pok
X-Gm-Gg: AYBFou3RBtxRRvYhKx8bMdC+O/jeC5AC1hN5JuYu3KW5TsunnEjt7Dg5+Ipz66qDhWU
	bEQDQwmLLmraQ8AWXkBGIudh2qXl4afK01UH7bP5i+/axNBEGNjKVJtjlEE8HTbKRsOies/UjCV
	KrGmZe/x8+wAnDM2Xi9TY6ObE5n6hkDyu2ozfZOqLEKa5+R3qL5fBYDg5WVPuIvy5a8PbuaFHF9
	LfxyxbF4dyyn+MAhnIg2DqNwSaf1W0XyO3WhMRSJB2glfKsikpqgsA2MyUvmu7YPSWka21T7VY=
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id af79cd13be357-947b00201a2mr849201085a.62.1794472898787;
        Thu, 12 Nov 2026 00:41:38 -0800 (PST)
X-Received: by 2002:a05:620a:29c9:b0:93e:7dfa:2f3f with SMTP id
 af79cd13be357-947b00201a2mr849197285a.62.1794472898061; Thu, 12 Nov 2026
 00:41:38 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:41:27 +0100
X-Gm-Features: AclHuK_y_fjpiV6obT_WtVqv7QGfmoWmqqnBvzPuhgwLPzV3bZAbPmW-Fiags_M
Message-ID: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: oONVaJYSWL3z9Q227yFj5pg7LvF5v3-Z
X-Proofpoint-GUID: oONVaJYSWL3z9Q227yFj5pg7LvF5v3-Z
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af57bc3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=C43g6bSQiVhdG0YezvUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX9LiBGIXqC36j
 JmXoBD0dnre5/s3DJGtiLDcujVDhbKC6deGkknwejhJK0wEKQJqHZdMaZmz43srz6+RSZE0Xs+o
 VA+Vzrziqd0+sBspAHsoFKnlO0MFNdU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNCBTYWx0ZWRfX1EHuwqA3+0zs
 UnrVx8TPUm4eFrAgM5O9stBqPn0s+nuL7PbMqSMcCZoHhLzlciKAkB40XLP2msbeLlDhzn9wT8b
 axeedvEm7XN7iCj6qlFGLJsdV1BNNlqad7bnJrZm/GQhQfua5PzkZrij4RcxCowaCYiJP56rVUf
 utB9zDVkyqsTj8/yHaWcRnwm1r7pzs/QlJ7S3SsqTAoXiDaJuVvMQn9cZcilptSY3m2+avqKN2T
 cIDaE7xCBLNLUt6MJwflRQKelMVMimQ0QBnxWZFW2/idYiFdjz5ehvXC79PRWRyMI+RB4pNW0hG
 YVxh7wHFwjZMrAg0uhvHY4nrJXT6OmUspA8UAbZPTD8NA/yZV/I5YtT7IjZZaSpil/fLsPFWWvH
 SF7HOWeX3WiImN1JRPbs24dXU1nr4O2UvleJO8H6lcmUsKgTIIimxVCa5oBIrjobwX3pBBb5J7J
 CJNF3ipzdrBdgky8nEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120034

Hi Atanas,

On Tue, Nov 10, 2026 at 6:16=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) and SC7280 (Kodiak) SoCs.
>
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domains, IOMMU stream, and interconnect path.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-j=
peg-enc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> new file mode 100644
> index 0000000000000..112580f3df10b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm =
SoCs.
> +  The encoder is a standalone hardware IP within the camera subsystem th=
at
> +  performs JPEG compression in memory-to-memory fashion.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-jpeg-enc
> +      - qcom,sm8250-jpeg-enc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: bus
> +      - const: config
> +      - const: cpas
> +      - const: camnoc_axi
> +
> +  power-domains:
> +    minItems: 2
> +    maxItems: 3
> +
> +  power-domain-names:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnects:
> +    maxItems: 1
> +
> +  interconnect-names:
> +    items:
> +      - const: camnoc
> +
> +  iommus:
> +    description:
> +      SMMU stream ID for the JPEG hardware.
> +    maxItems: 1
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - power-domain-names
> +  - interconnects
> +  - interconnect-names
> +  - iommus
> +  - operating-points-v2
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: CX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: cx
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-jpeg-enc
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: Titan top GDSC
> +            - description: MX power domain
> +            - description: MMCX power domain
> +        power-domain-names:
> +          items:
> +            - const: titan_top
> +            - const: mx
> +            - const: mmcx
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/qcom,rpmhpd.h>
> +
> +    jpeg-encoder@ac53000 {
> +        compatible =3D "qcom,sm8250-jpeg-enc";
> +        reg =3D <0x0ac53000 0x1000>;
> +
> +        interrupts =3D <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +
> +        power-domains =3D <&camcc TITAN_TOP_GDSC>,
> +                        <&rpmhpd RPMHPD_MX>,
> +                        <&rpmhpd RPMHPD_MMCX>;
> +        power-domain-names =3D "titan_top", "mx", "mmcx";
> +
> +        clocks =3D <&camcc CAM_CC_JPEG_CLK>,
> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>;
> +        clock-names =3D "core",
> +                      "bus",
> +                      "config",
> +                      "cpas",
> +                      "camnoc_axi";

I find the clock names a bit inconsistent. For example, camnoc_axi
explicitly refers to an AXI clock, whereas bus is much more generic
and does not follow the same naming convention.

I don't have a strong preference, but perhaps 'bus' could be renamed
to 'data' or 'nrt_data' (SF path is associated with non-real-time
resources).

Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

> +
> +        interconnects =3D <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_E=
BI_CH0 0>;
> +        interconnect-names =3D "camnoc";
> +
> +        iommus =3D <&apps_smmu 0x2040 0x400>;
> +
> +        operating-points-v2 =3D <&jpeg_opp_table>;
> +
> +        jpeg_opp_table: opp-table {
> +            compatible =3D "operating-points-v2";
> +
> +            opp-100000000 {
> +                opp-hz =3D /bits/ 64 <100000000>;
> +                opp-peak-kBps =3D <262560>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_low_svs>;
> +            };
> +
> +            opp-200000000 {
> +                opp-hz =3D /bits/ 64 <200000000>;
> +                opp-peak-kBps =3D <524760>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs>;
> +            };
> +
> +            opp-400000000 {
> +                opp-hz =3D /bits/ 64 <400000000>;
> +                opp-peak-kBps =3D <978600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_svs_l1>;
> +            };
> +
> +            opp-480000000 {
> +                opp-hz =3D /bits/ 64 <480000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_nom>;
> +            };
> +
> +            opp-600000000 {
> +                opp-hz =3D /bits/ 64 <600000000>;
> +                opp-peak-kBps =3D <1095600>;
> +                required-opps =3D <&rpmhpd_opp_svs_l1>,
> +                                <&rpmhpd_opp_turbo>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
>
