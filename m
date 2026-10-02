Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0F46AA61
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932800; cv=none; b=mmbTp9qWSs9pPR9O3ixGsMBt/J3WdIWx4zJXmohaVXpfA2V+J+w/LqLqO2rv3SHr0mKwwDDXVDEQipXtKEDkoFKxAOo6CdU1IU2t3aj3JlijqBoHwF/DuQcgCMkLW7wjy2LxZavh57TsaLYQ/YUjOcyinGeyCdY4nyN1q+TG4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932800; c=relaxed/simple;
	bh=SRiJOabsJOJ91REaT9PsxaaJ1Wgcz5xlOzFv109jR3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YB/ZGS9breqmXdEUjrRJvBEuLD2x/n1lqmGxWsI8a3qFrtY23YqvXlWKYPHPpDB0z9n3jEgm+5jRshVL3t3pWPjf+LnPNTVcK2rD1ib4UTNObKCyNFPWNk53/NYqBKn5xqvUJq2r62AXQ7ytKvnDqIOHio70c4eR5Zj8X3hAnd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5olVGuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7zjUdVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5olVGuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7zjUdVA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jeI6036687
	for <linux-media@vger.kernel.org>; Fri, 2 Oct 2026 09:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Xe19vggvY9hInc0pQhls1gOb
	n4wriMNRyAYJGjlvjN0=; b=M5olVGuG2dQeBMy2j1NTuNgSNsdCmVwV1IqP+kqf
	kSzUZQaSa2Go+JLHQaipv/TZ4pbhJ+BM1ZyCnLomT755GMSwp5k+yttRrBZD6MZU
	8bldqJ68qR7Sihw1d2589zSc0+YMHYlQLBjm6hpbOR2F7Diqi/UCVGJWpjHXLmHE
	f6Dn9w69OlJClWgWkp6eTq6hCNTnmXkVE59XlhzNaHxM5zJhjap19v9leE//IBUp
	9ByttGNPCMf7epR1Ef3Fr2szao/E0qjHmYkKRvsnNS+og1i7S3l9dk2+8QtV1jxr
	1O/rejwMI4k5h7ahQYXpqzyqK76RnvAmxhi487vJY5ffog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbgbcw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 09:19:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939c30aa9a0so791106085a.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932792; x=1791537592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=N7zjUdVA+oc6R7S8h3HNcdjrCKGdxjZ2S79lHNm5FNcKX+zNdqj3j9hnz5GlzEZPO9
         rHLi5IMFVfi5jqZbp1pNZY7sTMM6i95cuWfj0MTN6/iFSgONVTq0Qad3koqS9Vdi2/H0
         LtomywpDp9tqEDx5B/rAAN2dK0c8wHmMRVqEBy8z1bhR8PxNrSmgVqqyJwypKonhB7z/
         WU4VGMWVp5NJ74nIFG87AAGrxiZVsqmR4kqc5wB3RBqBYOnX+D2CT+sLAqTgnbX6KGak
         r/Z1dokaFjcFp1SxDM8Ix2CydJZOBxSKRoGZSZPUJXeDTdiBnxAU2FmbWFmp35YfH9sU
         vYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932792; x=1791537592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe19vggvY9hInc0pQhls1gObn4wriMNRyAYJGjlvjN0=;
        b=VBlCRmlNeqkkyZVtfaSsKRGBoR2lpPx//pNRUILHSkxS4wIN0qjxVQdR0mwefqi6cf
         yqp5eT3paNN9JSrDcZcZfv15L/MWYwwYJj5bifY+dWT8HhT8CzIIg6IcPLTyXBDlgphi
         Nx/XT6KNrC3icy2Ege3TLMeD+s5ILMQtcR2mPKPWimAnKq8yQTjzWeuVHozUOKPYGHvn
         41XqBf4r+l1tpJVnWITc6Jl3dGX4Jeu/4LNY72yohY+wKo2m1ivKtdiKK9THTNHTlpTX
         0X8GG8CrkHvgggpVmOSSKPRRjaIeI5V9LJ/iWaSame0ShLdry7Y8lgNHoJzFn+LLFRsw
         PuUw==
X-Forwarded-Encrypted: i=1; AKwUvBzFCGcRJlGg8yT50mTwJeZyy619N40wEU5a5/PvlcUIceD6pwQf1IjtJXdjH47AztkGkhmrn9Ip6NThag==@vger.kernel.org
X-Gm-Message-State: AFuF++lz3L3K5mgW0XulHrx6RpW1plTrB97a1RMpliTEjAf9YhYgk40M
	1RUiNRQlW1DiRlEyfjPo43Io8SLlBfh/O0fez0muIqRbxZUq8fnCsjqyJ6Vox96Rc0Ld5jwqPNB
	4nzY5YQis6lcfNq5aR2k9oY8aj73aWIF6pTu19WM6cekXwqlMToJzkERfDxotRgXAvw==
X-Gm-Gg: AYBFou1Isr+GMsShqDNivM9xgCsnUUFUQxxBolDl6Hz5Z4juSTD8bRq4vfHQdwJ+I3P
	qKC6IcpSOQe8xnIaMBpHxxit1I6bvXmT8wUNmFmv8Xpstc6hYiS1kMwgYuq20PPZvxEjKdAfsad
	iHH6jGWGUt/nM9Shfo2HHvB0nh2KJ+kS7mJBQhsFdqSozvjQ7AIaZMBkCgDBfseChw3xltbiWvh
	XJaW7jgox5VaBwGRJuinlg6HhbO+zXlD41KG0NkN7CEvcVV3pkcLAtbBs4tS/1xbBelBsIwM3zk
	jwluo8PYkfZ1QUXJGtK0f+nQR6cVTWbIT3Njdyp7tjTeMHEhhYDBAq77LNnPQ+gX9XdPXS+Mrb8
	kR0T9olH2q+wbZdo=
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325457985a.56.1790932791784;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93b:e9db:1bab with SMTP id af79cd13be357-93cf188feaamr325455385a.56.1790932791234;
        Fri, 02 Oct 2026 02:19:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm71901235e9.6.2026.10.02.02.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:19:50 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:19:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
Message-ID: <ggoarbgjedwjsubpiap6fh2ks7yd35i2unfu2tlbqcitxru3qh@ue5pb435infb>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX11ljRjHvYFXt
 sUnjTZEXnGhLkiluKsqy4po5Z6vOYdt1KtXRF8dQFiXEaWbn87wX9XWwejRHxf5bpLHb9DTsH/l
 AWXDzmuPjMIA2zFq6IOSCHqLrl5cEdg=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abf7739 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX1W2hzFoBf5Ku
 oVaIolHvc08hGQdeVK/MPe6HoCgPB4GCNaxvF3p3/TxlK3fobNz2Nw4VNIUWAs2xrPkPxngrhlM
 39lVLYqLiF/E/VDYwiF/D7NQ6JLvQ00i8TrQREivd9Ud65/Zy5UB7UfckyR6nOj3Mb/NAkPplUS
 4grxlHGG/1UTat8Ao1UHQdKJ8dO3OyWqSY2D7oQzUf604Wf5U3u/9XhBKIjgMFmoyhbM1vQoxLk
 DXufMIjdC3ITju9DsopAdTcvaYkFskg4cQMT9vNZ3fLWIJlNdzCcP8k/R2csXcNXYmKEnVRsIDO
 uMKfvseWnQt76oeDHOiMEWvS/iXuDbHVpH6Ys7dqgeZEswYa3aX4aCPndnLgtZgcl/Hls73RQvO
 rVDwvrc1SpVr9UAULnm5O5JClsUfdNBlpIR2Qp/Asx86zEiEbEKranFMjrfrzZ5Zok8mcnXBYLT
 iChli6iuHyS48ABAAHQ==
X-Proofpoint-ORIG-GUID: AhsElKaACN_wX7bYueuFqwHv4VDLcufa
X-Proofpoint-GUID: AhsElKaACN_wX7bYueuFqwHv4VDLcufa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-09-23 11:27:56, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
