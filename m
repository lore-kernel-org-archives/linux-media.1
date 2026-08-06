Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185238654F
	for <linux-media@vger.kernel.org>; Thu,  6 Aug 2026 08:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005976; cv=none; b=bx2I7rVWtiFPIpe75m7T3HJV0kAITeXcYthJNQtfCTQIYX2EltbjC8cqMC60mnQavbHbLktys5u/Bnff9G76v/3pecS/FPzeA2lbFtcP61g+n2Ar3yXfp0B6IDZF3Y085OuKp2NpcYXZbCcogCanVrJol5b2fZyHFvlwUa1DgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005976; c=relaxed/simple;
	bh=x924LvagBvs9zGNGovI+PJGXhMYenuCHaOCGGsy5L3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkNwN6DB9fhnQy5lZxs2qLWwbxcPlDDIS7B3K2pieVttcZ/WsXXt8TQEnh5nVlNh3lyKUOXfUohdjNpPsD9VaZF0QLHgg4VLVHFy+eVaOZBW5dEnmYW62uCc1raP1Z5VfrDjHtTvx+gJ/0+fQ/eKnJdLZ+xpHX9yYPO4NQmRLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J2fJd2Vn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hIV/WCQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J2fJd2Vn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hIV/WCQ6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6767Hflh1354132
	for <linux-media@vger.kernel.org>; Thu, 6 Aug 2026 08:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z3U+LaXgyAfHEPCwvvkxr+LS
	jwWxPhlVa1SScnQkLRI=; b=J2fJd2VnkPqT3Ry79LyPOwTAX2NC8jUftvABNehh
	TNzK1sf0+MulSuY/8XlafHP9IDt314NTvFQYnNuoAGNqYzX035pcyQ5Srit6gpOo
	38WI9LcQXkY80Y/JAVWWNIUXiuIvklZ1I/ZHoMIaKZ9sVf/2i5vu7F0MXeTRirkq
	5RTg3xCuODqZwDqA5Qy1t79qhVpIo4DLdMjBhyHpek5Rd0dq1OkPfVTyNgS5ZLmP
	sXvPp2LjAD+jTR86+VhMl+nUyCElATyfwKXMMZAPxnw+eaonND7HRKwGOzSMCu/G
	ej45vC2Rtwuq7e9A+5eb3bsGmWss6/TS5DTAFkAJt6Ob2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmk8q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 08:46:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso20507881cf.2
        for <linux-media@vger.kernel.org>; Thu, 06 Aug 2026 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786005972; x=1786610772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z3U+LaXgyAfHEPCwvvkxr+LSjwWxPhlVa1SScnQkLRI=;
        b=hIV/WCQ6LtPZccw9XCTcPGapYt0wRYrKsGhsrA2JmgIfyd98HcQhjMV2VRpe+6QcON
         vaHwvy7hJalcm/TjCJjTiff6PkYkpB68RG34TvDZdsYZincIb6ABM/zp39t2Qu8WQksO
         Y+wzt9zykb0+JRs0QrU2TXxxybAKtJHczkHh+3fAHy3clLxTxgodjDd49UL8hXNPriad
         Sc0LrRALjQqwb74oA5onGO9c60w9hfxTJVDVfl2JyuBZHjdpsXIeE8Km/HEq5KVnxBXe
         u0zCysqHKcTQthY4Dvj1zDZut00lGEqDc0iS8/fqQUz+IvTQvArukBprcJXw5IgQ56QN
         AyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786005972; x=1786610772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3U+LaXgyAfHEPCwvvkxr+LSjwWxPhlVa1SScnQkLRI=;
        b=QwtmgPP2M/iurHiWoNRCzYXttKl69vK3cCoHbpRK+KBu2XRAvw/aSuOep6saUQf50r
         mBqD8gfn933micNbpPFK30nMYEb2iAVIbQohrW/pXbLEwQYZFgTlaEKhLJ/U+efNcr8F
         33dfbFNMGm0DOs/I4lq8N31l1KcJG1qGNoMnUs+U9GwQtyc2lpPbCu6AMdHesAStGtC1
         3W8xupNs4ov3u637XpZuOpt7i/lmm5FaCtKfReUhHFwCsP2QtnArcjIv+5rt4ZRNAKYB
         EdJuRGrxUfjn2kp8Vjb0v/H1k2Dt4J4H/wGJt0tqwryJAZoRJUworYZQ8quT/MGkiMRI
         5HXA==
X-Forwarded-Encrypted: i=1; AHgh+RoEOE5l+fUHdzfEpvidUM1KkD8uPELynn9VOZ+kVehjzaxnVq8hgmRYxw4nyO/PY06V+duafEjwTRCj1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6pwajRdPTXSrEUPbHcCbw0HrJ6TEGYTEXvgwLf0sl90wOAZgv
	MyYfz54cLNqEr7qvSBIi015XspPnuCcekP/ernxR/go+H4aJk5tkrnhc1x1e59ZYPxebhsms4i+
	Hj5IhCVJCZhg+fI/Ek6KuPGS3JNMx5hZI+LW8/mK67pjrr4Ao/nreCwscKOftmslcCg==
X-Gm-Gg: AR+sD10jluTXqq/z7FYwIc0t1KQxsHfzkTZ1Dg5VC6I3vQE2nEZMg9UBbPGoJ+9lJjq
	zZC1SqtqEAASqbDmSb94L8cebJuFrowjEVtbJcpJFL+rQQgb4LCFp33ycxnIexH7Rnd+KlrYidF
	NplWgDipRxCQ9v4KYrV3mrfL3lw1mvMgNazVjbz9LPkWFGTS4+sXPSuQmWdPskVmApyL0EjQ4Pm
	tadmYpJfkkN/ongVPLnebMpEPytDihbcgotvoBMT+9iaS8/DRhYmj04MQMz4lfe+06v1fKd91m8
	J15ulByjiV4an2ggYJdFR1QyoQM4KOZkJ3xQ1vsGou6qhA8Zhux/jngtr4AViS6Cv0Gl0HvnoLH
	HSxsuDhFd421zdcyqrby1GPdmDs7w4FeWoQwvc2kZoUqytwHOVnvmSGe6sSwQHIcsheAUtE1Gq4
	eCgyrgSO0zW8IlfQ==
X-Received: by 2002:ac8:5941:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52ce5f91a4fmr131338021cf.17.1786005971552;
        Thu, 06 Aug 2026 01:46:11 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:51b:f217:539f with SMTP id d75a77b69052e-52ce5f91a4fmr131337511cf.17.1786005970990;
        Thu, 06 Aug 2026 01:46:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df6bsm578947e87.25.2026.08.06.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:46:09 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:46:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, stable@vger.kernel.org,
        Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context
 bank subnodes to common schema
Message-ID: <m4rccl6zsdzmkzntc3njv3uczcppva3passjr5ukmru5q6rylx@wlwha7ydttfp>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <20260805-dark-voracious-jacamar-6aae4c@quoll>
 <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a546bc6-a2b4-457d-ac27-05fc1cfe17f5@kernel.org>
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a7449d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=7De7YDJhBeuExJeypKAA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-GUID: MjLy0INSNdrDtRJ4FOVC9mEdtxHSHJ9R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX/PU2igBBSnkD
 2IRLhODi9h6ThUKYyWNNT2ZW7qnS5cc2+06rlLKjfgz/GwsWj+5VoOEflstw0sje6VajVzxfaz8
 6T+EVfi1JfPTM+pVrifrF7YYVDOgdIQ=
X-Proofpoint-ORIG-GUID: MjLy0INSNdrDtRJ4FOVC9mEdtxHSHJ9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA2NyBTYWx0ZWRfX68J2znstO2uu
 mCGMHnmzfKIty3+hsnQ2UV+5TCDuZM7aznt3va22huM+0tf9HCXjPzq1iORCk/JFtMtpaIAr5iZ
 SxDHk4CZCuy8PTjxRJJa8LaPIFSnLvuA7vdcTMEOmbSzRVICaeRWIzwLeI1ZquQIPxeuOT90oFj
 /ngWG9xKsO9V8e6uTB2Qj6boZ25UZviMEVJuBVcy++N4QeEJCj6JquAql4pQsSKYJ/WeYpEFFEZ
 uGbzNhAbztXVYIV2VtAY2KjeRMme6Qyk9GUdJd2Z/3z2BQHEhj42IWWhypNJVHqGQB1i45dcrxD
 TbPvEz4cpXSKAJvLPU/cp78SuFf4gtbb7V/62PEZu6WSCSDSDn3KObA/N6cvUZWsTbYrynINgJv
 VGApZ3dg3Rd0jrTY78a+wU3NfVUNeZ2MwDhd27lTrcl5eYKaDQilwAFXU6fVvDh3CCWrEbE40z9
 Kipgz7mH7MkhUM3WaXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060067

On Wed, Aug 05, 2026 at 12:37:06PM +0200, Krzysztof Kozlowski wrote:
> On 05/08/2026 09:21, Krzysztof Kozlowski wrote:
> > On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
> >> The VPU issues DMA through several SMMU streams, and the hardware does
> >> not give every stream the same addressable range. The non-pixel stream
> >> is restricted to use 0-600MB of IOVA space, while the pixel stream can
> >> address the full range:
> >>     +-----------------------------------------------------------+
> >>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> >>     | 0x25800000 - 0xe0000000                                   |
> >>     +-----------------------------------------------------------+
> >>     | pixel stream addressable range (0 - 3.5 GB)               |
> >>     | 0x00000000 - 0xe0000000                                   |
> >>     +-----------------------------------------------------------+
> >> A single "iommus" property on the video-codec node puts every stream in
> >> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> >> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> >> that boundary the hardware faults, which shows up as unhandled SMMU page
> >> faults and spontaneous reboots:
> >> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> >>
> >> Describe each stream as its own context bank subnode instead, so that
> >> each can be associated with the IOVA range its stream can actually
> >> reach. This limitation applies to every VPU generation, so add the
> >> subnodes to the common schema rather than to each SoC schema
> >> individually. "video-firmware" moves here from qcom,sc7180-venus.yaml
> >> for the same reason; it is the same kind of node and was already
> >> duplicated per-SoC.
> >> Adding the subnodes requires two supporting properties on the parent
> >> video-codec node:
> >> - '#address-cells' and '#size-cells', both fixed at 2. These do not
> >>    describe registers on the codec node. They set the cell widths
> >>    used when a reserved-memory node names one of these subnodes in an
> >>    "iommu-addresses" entry: of_translate_dma_region() reads the
> >>    address/size cell counts from the parent of the phandle target, not
> >>    from the reserved-memory node. Pinning both to 2 lets a subnode be
> >>    referenced with a full 64-bit IOVA base and length, and keeps the
> >>    encoding identical across SoCs, whose buses vary between 1 and 2
> >>    cells.
> >> - "dma-ranges", empty "dma-ranges" states the intended translation:
> >>    the subnode DMA address space maps 1:1 into the parent's, so an IOVA
> >>    reservation written against a subnode needs no offset applied.
> >>    of_translate_one() treats an empty "dma-ranges" as exactly that
> >>    identity mapping.
> >>
> >> The parent's "iommus" is kept as an alternative via "oneOf", so
> >> platforms that have not been converted to subnodes still validate. New
> >> platforms should use the subnode form.
> >>
> >> Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
> >> Cc: stable@vger.kernel.org
> >> Tested-by: Daniel J Blueman <daniel@quora.org>
> > 
> > Not a valid tag.
> > 
> > 
> > 
> > 
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> ---
> >>  .../bindings/media/qcom,sc7180-venus.yaml          | 15 -------
> >>  .../bindings/media/qcom,venus-common.yaml          | 51 ++++++++++++++++++++++
> >>  2 files changed, 51 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce84639cb0aff59d8c2cc 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> @@ -91,21 +91,6 @@ properties:
> >>      deprecated: true
> >>      additionalProperties: false
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
> >>  required:
> >>    - compatible
> >>    - power-domain-names
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> index 59a3fde846d2196ab1e4588eb396012ba6860712..ccae41bed757bf3d9518cd4afe4565f043b45166 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> @@ -47,6 +47,50 @@ properties:
> >>      minItems: 1
> >>      maxItems: 4
> >>  
> >> +  dma-ranges: true
> >> +
> >> +  '#address-cells':
> >> +    const: 2
> >> +
> >> +  '#size-cells':
> >> +    const: 2
> > 
> > Above do not look valid. You do not describe the addressing of some
> > other device node (not a child) here. You describe that addressing in
> > that other device node's parent.
> 
> As we talked offline, these are actually needed for dma-ranges, but I am
> honestly confused whether we are representing this correct.

Vikash, you have been asked several times. Please keep the discussions
on the mailing list. Now there was a conversation which you can't
reference to anybody else having the same question.

> dma-ranges tell how this bus - so venus/iris - performs DMA translation
> in respective to parent. Address/size-cells are obviously also needed if
> this is a bus with addressing.
> 
> But there are no children with addressing, thus what sort of bus would
> it be?
> 
> It looks to me that having here both:
> 1. dma-ranges + address/size-cells
> 2. children without bus addressing
> is some sort of abuse of the DT syntax. It is allowed, but does not
> really represent hardware.
> 
> IOW, dma-ranges alone feels okay, although unusual, and it states proper
> DMA translation for this bus. If you add address/size-cells, it means
> this bus HAS addressing and thus YOU MUST use addressing.
> 
> If my understanding is correct, then solution would be to add addressing
> to the children (so unit address and "reg" property) or drop
> address/size-cells as Rob pointed out. [1]

Doesn't dma-ranges require address/size cells? In the end, how can you
specify the DMA address if the device doesn't have addressing at all (or
MMIO-style addressing)?

> 
> If kernel disagrees with the latter, then kernel is wrong, IMO.
> 
> [1] https://lore.kernel.org/all/20260716165434.GA290489-robh@kernel.org/
> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
