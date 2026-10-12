Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECEE443C29
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790036; cv=none; b=m3bgdz4vCbKgaF78aapxIoWGiy+abZF0wxBTLh2CzpDKrLzWBZRmSqhLUf1BLQtfvo+MW0R2uYHbzN455YqkxmCmdyDgQN+n4zC2xsEXKblf/Ng0uX85w73TjVGvBLvj1TE1bSR94a9W3YRAhug7u1xCG4dmKa4j9ExFwSqAp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790036; c=relaxed/simple;
	bh=i4VKammu5buQoQJpeeXuROL/djsewq+/0g1Rk/STEME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llFYdsu6jib4qOqZ5EsvMgBR+GfuHnKV9u14CUZfHzre3krmm2g/kRwuGq27A7KXOu5XnJUCG6T5XiiD89b/KBUNWoFTsJZ+hvo7lZhl9CFP+DsyJbDwZ5u5TjwqvOA+1XAJn/wEoH5v5TGcE0cbCWpYKJBMyZq0waueEXY8dxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bx6cXTta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PmEgM6wO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bx6cXTta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PmEgM6wO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56Aq41002567
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=; b=bx6cXTtaP9nm0zq0
	j8GTzMm0yPWTrSODa0JYEqS6RTFjREX/EAPhxjCh4mMmmgTPrWGYSOT5JJTc3kvc
	l6stk64/Ysu1Kn6g7CT/AtoXnGbUJYXWNjWO/M1xWXNOXBqpb2D6M9SftbW91oFX
	fzPT3ff6TmmHnHKZLszsecXzviWbuIgsPrGfJP8TKmGkaVRvjswIlvjB/oC7OIBL
	sM7zfN9o36xbZbgMzhjH54N8ebZfeTlvPvgYqGPVcUuohP9nWbQlZTUlmC1v18ZJ
	cUwyVP8ZG5z9NWAiIROd4PFQY98ljsOWrRY1RISe3/1R4DTk+m1v0AI+6lJ17h2a
	1z1k7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkgt53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 07:27:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e834ff4d0so489131385a.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790032; x=1792394832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=;
        b=PmEgM6wO5P09DBY4OwhjCm6nRSS/UjEjbnL6UAZMCojlGW0agDRrpGmxDHNPiJRcPK
         ADaTeJMnbNgQzNz2V2zQ409sE6djO5rpa8GbfE9Ce4/noW/KIJraxm7UtK2PM5Xo+Tmf
         brVqN7CASuOWWH7MpUZ+MNXXFOttN4toUOxuP25OT9khfrXww2PrQKM8ZhsMOiqg39zI
         0DY8GA1Fld/krcnJS2KPxqMR1fFd3kz0bnSi/A2kOeejyB07WyZ0ArL+eG9rSjAjRphr
         ummgdyWPIgKetFi7qqa0OGG7FavyUHaxi4C0BdUadkXYiGuyyO0B354k7/7WkkqMf1i9
         sP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790032; x=1792394832;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4fyEjrePybpWgh38Es527yBPdJjlebPtKOB1ktyX08=;
        b=xWI3QxJwylzuJW8PpF6dcveX807H2JrVEnZvWpGOsJHLrciAJzmpNu2Knu5mv5JeuK
         aSRjalaUReYYPZOCgiY8LkKjrPo9VyV1cDn0cuOwHMbSWMHpCBR9kLnqZMqs4XwsXHmA
         b9iMU4IkPCZtZAyL8YZfp8V9youyLrSsJvXG/YnkNqNdJN+nOE/ZliCztYavWbFC0p4T
         R2F2J9uB8xt+K3aVoayX28FP7jDad5iY930vGjw4T1A+Z+6nXhB7phhfoxOUnhv4whDh
         ebIV7tPiCGRtPG7ZViRhfzmuyHVgzeN1u7eZ8ohfVuxOUWPTHpX9dw7sEnQSkmnspJEi
         srEA==
X-Forwarded-Encrypted: i=1; AKwUvBxw/Vx+ftmvTgtjaNsEYjS+ZxOB8I4GeJh1T/NEL1lES77Rt6M0FyX3q+Di2/YmpxpqZhoVLHmvP6gLYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0oJCmQg51vFQHYV77jyK0bK1JwS3raWlkKEP2S9GOIKEDoFkU
	Y5nzFhXuVnzMflyqk1GasIMhfDiVGsMcXjpMvMJoFhoRZoMVE78TmFT+Zl9ShP6QOzELemmoHyZ
	DU09QeIyZ86YLuy58DGQ6gwOSdnDhr2xUhB6xPV/O0FU6vxhqDBA07TBpk2sSedn9YQ==
X-Gm-Gg: AYBFou3f4dAmuPjvuYx0/9nssWyPhWXroMO441SWu+I4Nqr6zlYYCLJXiifTzbR7m7T
	Lu0Vd1tl7GUEvwqJyip3fojETNw6ILRUwNKPsRZLegYilskNT1uZFM8pryZFE8AuQXheKgfFHqp
	JdlFIqPKNyA4M8JCE3r8FxMWyWLBsoEQaamnelc7xETPLO23/nKovLvhlSpo7mCR65+LCKxPdqb
	EGSKsY3DR1Cz7pHD66dBpdqtgYhrEcd3k7Cosx0FHxhszoMJHEqNPR0i+5dyaND+IAAzhicTgAV
	Yg37KaDlGmbVtXgf1JLQn9Mx1iJsaYalbleCIy0SzWmqDi6hRNCgDvsBt3wH93h8NxaSYvYRArZ
	IYIsw+CdZgfKIl5o3Ok7RWZhMgv4WDF3TpdMOydc=
X-Received: by 2002:a05:620a:2713:b0:93e:c12c:fbb8 with SMTP id af79cd13be357-93ec12d0844mr1554167285a.69.1791790032502;
        Mon, 12 Oct 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2713:b0:93e:c12c:fbb8 with SMTP id af79cd13be357-93ec12d0844mr1554165685a.69.1791790031953;
        Mon, 12 Oct 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm267210535e9.15.2026.10.12.00.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:27:11 -0700 (PDT)
Message-ID: <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:27:08 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on
 SC7280
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ravi@ebytelogic.com
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916065422.819512-1-hitesh@ebytelogic.com>
 <20260916065422.819512-3-hitesh@ebytelogic.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20260916065422.819512-3-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXygJHBXJbYHIO
 ARzwklrvYCWFNe6OJEFVTNXczMKe4tcDtUk77xx8xP4S8UB6GHJ+fFv4Ngnhyl6EkPM1zzjPRqu
 kyoWsGamGcuYjqqboV1IJi/GwrVu+qpkBhWmjhMu7CgopVIkDFCRNCxT77ij9V5lLPlAs8fbDPl
 wKzZGEXeYOCvlIPBGnIQdPbTQOxuFwVTNXV00AdgabirREHtdO8Me9ltuS+HZ01GnymxE3tr1ka
 oh1sO994LmHhNbvT75jXLgozy1Cj2AVxIikPh0RjZ9rZ14hIn1vKzXgNiFj8Vr+uPasrhK/eVX1
 IyNbBzqHgwVFocFiyIMtpyQ9TGYP92L+ToBq1Q+DkVMYIMUCxMMVzi93lR4uTVcDPZJSioDWJpf
 3YU+tCbvYoDS+5gl/uyq6l8ZiyAOaSp85tUosQYsf8C2TjTEqH6lsXSbyMFfJpi1FNpqADVO4OH
 sZjhkZG0D1aF2eWKC+A==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc8bd1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8 a=XLtVEzLVMLZyz3yzeyUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX7MXpSGVIFU+d
 i2Iiy9yNKFqiN12DisGWzt0F63aQR119dqykLp/fK3oWmrPuOPI7qoRjLDulNYWLHElOL1pCN/1
 h41PU8z75rrIrvFSK+ASo6TKLhtnh1c=
X-Proofpoint-ORIG-GUID: cFgGurh3-r52FGUgnzI1g414PjbhXkd7
X-Proofpoint-GUID: cFgGurh3-r52FGUgnzI1g414PjbhXkd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Hi Hitesh,

Thanks i will try to include your changes in my next series,
it will need verification from your side as well.

~Gjorgji

On 9/16/2026 9:54 AM, Hitesh Patel wrote:
> Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
> done for SM8250.
> 
> Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
> deserializer, one camera per CSI-2 port, so two independent pipelines
> share the deserializer subdev: both cameras stream concurrently, and
> each can be started and stopped repeatedly while the other keeps
> streaming, without the WARN in call_s_stream() and without the second
> pipeline tearing the first one down that the legacy s_stream path
> produces. The CSID test pattern generator keeps working.
> 
> This patch applies on top of Gjorgji Rosikopulos' series "media: qcom:
> camss: add V4L2 subdev streams API support" (see Link below); it does
> not build without it.
> 
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> Link: https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
> ---
> v3: no code change. Reference the prerequisite series with a Link: tag
>     instead of a long URL in the text (checkpatch line-length warning).
> v2: no code change. Add the dependency to the commit message and as
>     base-commit/prerequisite-patch-id trailers, so patchwork and the
>     Media CI do not try to build the patches standalone.
> 
>  drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 0201debd4..2023c0df2 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy0" },
>  		.interrupt = { "csiphy0" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 0,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2298,6 +2299,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy1" },
>  		.interrupt = { "csiphy1" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 1,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2316,6 +2318,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy2" },
>  		.interrupt = { "csiphy2" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 2,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2334,6 +2337,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy3" },
>  		.interrupt = { "csiphy3" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 3,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2352,6 +2356,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
>  		.reg = { "csiphy4" },
>  		.interrupt = { "csiphy4" },
>  		.csiphy = {
> +			.streams_enable = true,
>  			.id = 4,
>  			.hw_ops = &csiphy_ops_3ph_1_0,
>  			.formats = &csiphy_formats_sdm845,
> @@ -2373,6 +2378,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid0" },
>  		.interrupt = { "csid0" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2392,6 +2398,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid1" },
>  		.interrupt = { "csid1" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2411,6 +2418,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid2" },
>  		.interrupt = { "csid2" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = false,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2430,6 +2438,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid_lite0" },
>  		.interrupt = { "csid_lite0" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = true,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2449,6 +2458,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
>  		.reg = { "csid_lite1" },
>  		.interrupt = { "csid_lite1" },
>  		.csid = {
> +			.streams_enable = true,
>  			.is_lite = true,
>  			.hw_ops = &csid_ops_gen2,
>  			.parent_dev_ops = &vfe_parent_dev_ops,
> @@ -2475,6 +2485,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe0" },
>  		.interrupt = { "vfe0" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.has_pd = true,
> @@ -2501,6 +2512,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe1" },
>  		.interrupt = { "vfe1" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.has_pd = true,
> @@ -2527,6 +2539,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe2" },
>  		.interrupt = { "vfe2" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 3,
>  			.is_lite = false,
>  			.hw_ops = &vfe_ops_170,
> @@ -2551,6 +2564,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe_lite0" },
>  		.interrupt = { "vfe_lite0" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 4,
>  			.is_lite = true,
>  			.hw_ops = &vfe_ops_170,
> @@ -2573,6 +2587,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>  		.reg = { "vfe_lite1" },
>  		.interrupt = { "vfe_lite1" },
>  		.vfe = {
> +			.streams_enable = true,
>  			.line_num = 4,
>  			.is_lite = true,
>  			.hw_ops = &vfe_ops_170,

