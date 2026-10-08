Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C944E67A
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 12:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460979; cv=pass; b=O8L61OJSTFJBiQ9y5cs5IMzEQBl4UVh1dgl/OUO/8bEFTrzQlg//KYCLbD8doHCV7FQtbv2qnbew1WPAcA5ZCdmepQrhy9XFX02+G+IX+DHaeGXt7uuHzxdQuDtCqOa8vN5Hv9kYqGLF35DIl4vEDCVawFdOHqYALOJjWQCgRe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460979; c=relaxed/simple;
	bh=atg9JnBD4PDdiE+BfKr/NcQOT2zg/X/V3XZ+Lu6gJG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXHX2o2wcMsJjVmcQIcuUoELUOdvrckyvjzPl7rRack/7b3RZmlTiNYbL0TxFKqBbsqsZqBA6s5svF5hp+hY58AKlfRTYYYmpkmxcHGhAthIdhDtCN21pzWufD64WrO/Bmt7vEZmTGU0ELpsc9BvWGJHIdHy3J2nDEHBlyYP2AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O990Y1K1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA55Idp3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O990Y1K1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA55Idp3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8Yo2116437
	for <linux-media@vger.kernel.org>; Thu, 8 Oct 2026 12:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=; b=O990Y1K10A9ypcip
	befJvButvLu/PxGlGOk5dHc47/XogKGXY3bxmFxjc+31q15wG41SGE2Ws7wDmhkN
	mXpvKOf52DB5m7NvLpsyj+99fGZV0SKic//81IT2LlUXsKMYVffYsqpVp96WNJu4
	yDFQMDErV8TpYGB8k794nUG9GxR21ZQ8CsyJmy9yGSgfy3Kfie+mo+UezwYC/ZFf
	VAPOxHVIvKmP6tNEQZqSVf4nZFWDPXDWYoKYLSo3uFwHPlxDfZa5HOnuJGq6Jw9n
	5yBPkCJO9qK0wKqB0St9jtoW3qEMmZt5eukATFZlrgvMoFXG65HsMsZ35oveMGsU
	qjN+Pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe52sj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 12:02:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8504376a91.3
        for <linux-media@vger.kernel.org>; Thu, 08 Oct 2026 05:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791460945; cv=none;
        d=google.com; s=arc-20260327;
        b=j/W7z+hNzJNMgPuK6Vm9n9nCXAqexgrofnWmD4X9MS1sqXcaXhLu43NtHjRW09kliQ
         KOXAFeEUHSZ2QbEhNqmNXjEv179USNwhaTm1+OZCiJem8YCJ9qNI4g+DHsyE9sL7vz3E
         fehV+fGSmYMQsrFNOq+4nnd/2wB8jEoJKHxsFIUsns6wroFsF/e9YX1YCJ5yTW1H8j6r
         psYeuBxA0Aimjxqk3Fbu86bY8B30KP4xamSUDfvzyC6LhyYSoLqC+P1eCWVmLJc56LZS
         Goy/Qk71zPtsjegESsHVk8qZSIws4kJR+wKzvrXBp3O5vij9EY6FTL003w9zMDOdDtod
         NmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        fh=a1m+HtYwc153HTNp9ZxSH9W/H2fLbyeWW9MpCzyj6H8=;
        b=rNvRLrBd01/kJjMhLeseoot87rW230uNh5sIdjXdKZqqZ9udyxg/wBXwKqVwO0tSKv
         GVlJ/tOM9Ylc+WXWUPjNW9KviGyFCwOdG3bleHOWoUULktQTnX4bTv0hVBKntKAROA1m
         NHGgaJ18ukq9xmRMKoIwmuQHenXJRCXIkHQbQ/vHVKxQHVj/NcNze+QPlo3lP2huKvE4
         x0lzVomPqvlqi+DqlUrRsRJMRi7pqaGzMFEH31YLmolTZtZ0Cy2uDiVP8Mfm0Ei85mHW
         9V/4hwhq4CJMLa2uJXBOYcLD0EfWGRnfRXtPzVY4FMZL72o59h3JiD9KYIfkhNAMpC4w
         Y8Tw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460945; x=1792065745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        b=PA55Idp3cvLsMZnXALQy9gr1mXCTx9nSZ/G2225WR9SCdZixxBRjMmfX9AZ5f+/zfQ
         X3La5adl+uftUdTLqR0eef8mvp2dzEEvMj9f2rgP3RFM4YU4Q9Cu2CDgl0AbB5xlyr6r
         pyf27vO81nG2JuJHY+FwsBD9yyvLA17h/TTOui9mJxBPzTF87HtqUvQiFSeB7jIWoJsG
         7hJyq4vzP29FvhKZ42Mu1IVwiCBrZt2hn3CBDs/VEE4cu2wqWc+OgZURvzyEPJIw4P+d
         TbVXT1M+u/ppH5HU3dYnIcTEFbTimW0zc8aUu8ffiz/a6v71jdLsiglziupRJVH7QGYz
         KErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460945; x=1792065745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        b=iJACdjgTVV0cGeYSSID7I1IQIIh1/mnszJO9+Lq2PY1+fVvUTSnZiIFAuJbwB658GG
         oonKTfpINXq3pAmvquBBsZNGfFmy1FZGkeC/PBOyJn4/Kichmyga/r6wM+8qAQXrGQOT
         Oigv2JAJXSv5lGfCkfN1hchd9wM4DJIkjJ67F248YKYmOHN+QXDIh/1wkppsTlz9nGjB
         P2ThL7iGWXa6stnA/5FqwjDXDeNWYZ+MSUqAmhztfzry8LcSsMRkQh+3zifVFoz60uIt
         KobKBmag/SYcUwlm5/zJH8NuPblxJ/DFygaWlHPbGL6riTwECmvy3pPuAk3uBoAvtOcb
         Y1CQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1Hnhe+5p7GjJXP6eGnYrxxBMzQplL0NV9vDQ/M+61DJjH97BpqyyzWN3tIr/bjTvFYYkSYlieHtMnGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIck2j3AST2b6lUG6wlXIL+/rEPBAl48FOP/DeYiKxIF2ButHdK
	rQ7e0TEzcaXsMD00tO1kLzta4UC/IJ8gH7va/thXBIijO4Mw1fRPND7ev7dO5kM9kIjoDWip0IC
	CyJJSrn76AIS+nw5Toy2SMRK+t+nrJ32j7AHkpeWnulKcqR6/nAytbvMRYhdB8YiHkEzz8jQZMr
	lY/myDI16OLWU2lrl8zQRZpD5Bcej8fFwBltjRKLFQ
X-Gm-Gg: AYBFou1swBz1PktW+Qpb40kPQeVy5/HHk1YmDouVyd5RMen9+TzafmBkdcPcT7sh8vG
	oHNJ6nJN4q/oQFpGeNdeosapNzIU0y4fUI++SwMVSJwH2S4Od48nQtAo7K8YA6uAbyCVnQJ55P4
	vxApEJpv6T+/o38xIQnF343iop8AyzdOhGX3R+mykO1FgAGm4yExUNfgND9Q==
X-Received: by 2002:a17:90b:2b44:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3a8a1975785mr5197696a91.26.1791460945012;
        Thu, 08 Oct 2026 05:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:3a8:6a6b:596d with SMTP id
 98e67ed59e1d1-3a8a1975785mr5197664a91.26.1791460944545; Thu, 08 Oct 2026
 05:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
 <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com> <f07e4b33-47fc-45a0-8fff-105766efb5e4@oss.qualcomm.com>
In-Reply-To: <f07e4b33-47fc-45a0-8fff-105766efb5e4@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 20:02:13 +0800
X-Gm-Features: AclHuK-05PCYVHzXB_f-P8kAOP2HIrxiCmDuqzqFR01bYQMC_H8MtqHJBkaqdg0
Message-ID: <CAFkd8huiKtJqEb1jMzCe6ZaQzatDCogFsQkhFBHAdyvDdbM=2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yFTAXxxso9sku7Jb3N_wQKh7E1T3Oef6
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac78652 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YSXHpTArrQjiSFk0xCwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX+Ugv49iVKnQ9
 qm4GPDwHTtBp33dkYZ2kQRkIu7qxF1EtgKcbH3Y+jVMWmyRhov/5eplv6nXPY5r3BdG1No+mGJ4
 dxgM5vjDqtDXlCYSUzY5BVrKjK8DeS0=
X-Proofpoint-GUID: yFTAXxxso9sku7Jb3N_wQKh7E1T3Oef6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX6idlEdCDsB81
 dTFF3o6gJsYdZXnGtDG60T9Zcx7Ve8VpCo1jlPn28/wtbxPWPKB+w3FzyTxmh0aHBZ67TrqQLIQ
 i7mZItQJSG6moUOfE/+MWxE7Hm13LCg2ahWFJA2cBZf4mVqkxF2ApFbwT4bHOXpb9kxyizT3kYQ
 HSVhg7URLE5ncCmxKT2vsKh135OkjmzQwlcoJW3p/D0JnPP5kyLH366R54xHv4TlbXhDyryHXJw
 ezeA4u+1fkvP6KeR7J28yJiqZ81eetL/beDkPBmyit5b70cxPK9n+uYDdzggYfPT6C+oXSHC5F9
 7YvC5ITBAnF/kEIOjvYKCDba//liKMws8VKILLOLLYzOOhd2TvOwxUI5iibLc0VBRefgrb3sES3
 hJGQAsFDvcwoNICVoy/QyN9uOmfadiyTo62gR/1j2UqKNeEnEZqDyfdiiOf/EYWbAiFSh+NiP5r
 vgfiRtWGpCBj2A8rKHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On Thu, Oct 8, 2026 at 5:34=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 12:16 PM, Zhangfei Gao wrote:
> > On Sat, Sep 26, 2026 at 2:38=E2=80=AFPM Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> >>
> >> The VPU issues DMA through several SMMU streams, and the hardware does
> >> not give every stream the same addressable range. The non-pixel stream
> >> cannot address the low 600MB of IOVA space, while the pixel stream can
> >> address the full range:
> >>      +-----------------------------------------------------------+
> >>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> >>      | 0x25800000 - 0xe0000000                                   |
> >>      +-----------------------------------------------------------+
> >>      | pixel stream addressable range (0 - 3.5 GB)               |
> >>      | 0x00000000 - 0xe0000000                                   |
> >>      +-----------------------------------------------------------+
> >> A single "iommus" property on the video-codec node puts every stream i=
n
> >> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> >> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> >> that boundary the hardware faults, which shows up as unhandled SMMU pa=
ge
> >> faults and spontaneous reboots:
> >> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> >>
> >> Given that the address range restriction is for specific VPU stream, i=
t
> >> should be ideally be moved to that stream. To achieve the same, a subs=
et
> >> of streams is now represented as subnodes, so that each can be
> >> associated with its respective addressable range. The design was
> >> discussed and agreed by mainatiners here
> >> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kerne=
l.org
> >>
> >> In the past, this limitation was addressed with an iommu-map approach,
> >> with the iris driver dynamically creating the devices. That approach w=
as
> >> later concluded to be a hack to avoid having subnodes, and was NAKed b=
y
> >> the iommu maintainers. It was discussed in detail here:
> >> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kerne=
l.org/
> >>
> >> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> >> stream is allowed to use, so the IOVA is allocated from the specified
> >> range only. Define all the possible subnodes so as to describe all the
> >> VPU hardware iommu interfaces, both secure as well as non secure.
> >>
> >> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> >> translation into the parent.
> >>
> >> The parent "iommus" is kept as an alternative via "oneOf", so platform=
s
> >> that have not been converted to subnodes still validate. New platforms
> >> should use the subnode form.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> ---
> >>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
> >>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++=
++++++++++
> >>   2 files changed, 97 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus=
.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce8=
4639cb0aff59d8c2cc 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> @@ -91,21 +91,6 @@ properties:
> >>       deprecated: true
> >>       additionalProperties: false
> >>
> >> -  video-firmware:
> >> -    type: object
> >> -    additionalProperties: false
> >> -
> >> -    description: |
> >> -      Firmware subnode is needed when the platform does not
> >> -      have TrustZone.
> >> -
> >> -    properties:
> >> -      iommus:
> >> -        maxItems: 1
> >> -
> >> -    required:
> >> -      - iommus
> >> -
> >>   required:
> >>     - compatible
> >>     - power-domain-names
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common=
.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04c=
e72cd5ae6815ba5c82 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> @@ -47,6 +47,93 @@ properties:
> >>       minItems: 1
> >>       maxItems: 4
> >>
> >> +  '#address-cells':
> >> +    const: 1
> >> +
> >> +  '#size-cells':
> >> +    const: 1
> >> +
> >> +  dma-ranges:
> >> +    maxItems: 1
> >> +
> >> +  non-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU non-pixel buffers, including compressed an=
d internal buffers.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +      iommu-ranges:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +      - iommu-ranges
> >> +
> >> +  pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU pixel buffers containing uncompressed vide=
o data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  video-firmware:
> >> +    type: object
> >> +    description:
> >> +      Context bank for the VPU firmware processing domain.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  secure-non-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure non-pixel buffers.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +      iommu-ranges:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +      - iommu-ranges
> >> +
> >> +  secure-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure pixel buffers containing uncompress=
ed video data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  secure-bitstream:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure bitstream buffers containing compre=
ssed video data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >>   required:
> >>     - reg
> >>     - clocks
> >> @@ -55,4 +142,14 @@ required:
> >>     - memory-region
> >>     - power-domains
> >>
> >> +oneOf:
> >> +  - required:
> >> +      - iommus
> >> +  - required:
> >> +      - '#address-cells'
> >> +      - '#size-cells'
> >> +      - dma-ranges
> >> +      - non-pixel
> >> +      - pixel
> >> +
> >>   additionalProperties: true
> >>
> > Got this warning:
> > arch/arm64/boot/dts/qcom/nord-rrd.dtb: non-pixel: iommu-ranges:
> > b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object', 'integer',
> > 'array', 'boolean', 'null'
> > arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: non-pixel:
> > iommu-ranges: b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object',
> > 'integer', 'array', 'boolean', 'null'
> >
>
> You have not picked the latest dt schema. Please go through the cover
> letter where a PR is mentioned, please pull that or validate against
> latest schema.

Yes, with the latest dt schema, the check passes, thanks.
