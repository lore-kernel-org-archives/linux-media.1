Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083444A725
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978043; cv=none; b=IFMl23ztb9ICNuuHaDBvVYU+FCygL2pjlywlC0HoeNdQP3qzhm7F48gaSbQVeg/P07RtA9TQmkxnMVlmrBAiu3TdBA+/a65yQLsE87hizCSe3985RF1Nd9FJbXAhn+3z5792M0LpHMaMd0y4TGVVUCjMo4ceiHfVbIambhP5zA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978043; c=relaxed/simple;
	bh=/o17aeQpgijRlxtzZDnQOtrwdMXAWUUf8iuyJjuFB3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Amgzgzgq435+kv2o98EEL78HSfJFAqBoYK7VaWK+Cdwa+1o5BZ4ey1SBCOXfy5fBaLZx5pJ8bGzx4D+zTaRD+m1jYEqmpsB4jqEKRN9iZdigJlpbJHsz9z9k/LvANzKpfO4S1GoTXYzp188bP2eKKDh9V66jf5RpEc9sjP2gqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYtOC6JH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aH4iKKCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYtOC6JH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aH4iKKCk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AOG93351570
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ifhh8R7B3dmTfCmH1vu6b/0r
	66BrQwpPWHEDqb0z2p4=; b=YYtOC6JHoWQ8RkNZYeJWyDX9pHGrXKIbLQUHxy6I
	zIoLmL6NbBBIEk/LsUQfZWxk0vVb4LuJs+LOzvborzot6TUqLkZBc0u2aenWyNLq
	UjQTqiUa2c82g9RGSh28v6GJ18jV8WcRzS/ID1mNcSfGFs7cOv03dbLn2DXj7Fyj
	VQD305oEorgxHqafJ8SjgRJJOOcQfEUG62PgMIdi+JuRiiixYB679knjSZuRHs7R
	KdKeghEB4aAdRMzmJBfM4CLqYN9kaSH9AHGTFcPr2fRRvpazBiT8yDtLFQ2g9UqY
	LOyFeFwDTK8EcmXNShHOIXU7urEK/OBbEwLSklb0W1T22g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq799m1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:07:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106fce784dso53843086d6.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 01:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978040; x=1790582840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=aH4iKKCkzLDrvgJRGt7z0Ctm00nIywF36k4WYHCQK2UkevCqtLBMv7d/03jLkWyCRo
         W59kZUocgD8Tf3E/MdnBwocXF3Bc2ABhbI9G4rbNr76NpNdvL7kGHBOVy7WInON8jlnn
         xsP+qgACUV7MIB8fOdklOwvzJawR1jc2ZWDO5m99tN64pKCHjYpN7UkzZkxWcwl2IoPx
         La3jQE6HyR3J/DIq2Cjk+pWPIZ64AhHZKOPFl1r9w2rt7DHsS+JYeinP9RdVeNyO0PLs
         2K0Q9v3qzrogoceLVtKYb/Cb7nYcRUNE6L9oBu+2eezzDm4UuDaaB/Almr3c5yzBFrB9
         J84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978040; x=1790582840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifhh8R7B3dmTfCmH1vu6b/0r66BrQwpPWHEDqb0z2p4=;
        b=Bycq/Qvj7Lh7C6pWPqCpv2fgu0dB6YcHuxQUkWUHG37XIDSu955Ujpb3AhAffv2Kr6
         ge8cij4ZtBDWeybvlpytCNUt1RSIOe6QCNqWAZjvDbT8/L7cX6KXFJgTcqjJTZtEnytb
         J3DRJ/iQ2qX+gVCLmMhZRmlttGmkj4KldzhFtog0HL3DqynpuBxDFfNmZuBxnGsDf+Bb
         7rOlGxMiIYHhdxaey719ltw/FPGUBhtSoQJhQSQCQL94NuWW6BIB2tftmGA9VoTtvAdZ
         eCQjsrcsy4lMEjC+F0VdvdXA+S/v30lZ75Srasbx5HyFy2pth8CFGXv85ymrxy9y0WOl
         o6mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG5JGM1kAs7t0ngEtFenvN3Mp9TTopWXu69Q0Twx0fYoxw0TM+RxgDTowQp6AaN0dj38PNJIb0oSOpFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++negddNokTmKK5kpouMfysedkQJ4DPOyE6u6K9g1y2nATI1Os0o
	ywDkhVXaufiGzzW0CrIQvarQ0GSj24fCOD+gIContPhshTZDfb+W6N4hW7F8TuH0D5Ax2P+EMpX
	2kt9df9THw1RJiE+Ek3Vl3Z6UsVo9RAMP9+jJMkg0ZOWlMEgN1mw9sA2OZf0lq07q/g==
X-Gm-Gg: AYBFou2qf7IRQHtzHBHRHvMuxB0f/xjtLyYR7byjQiI8RedHUnBaTIe2ZEibnsJznxr
	DzXBoKVSAiPXJVjBMzIoBwjEH2I2DEy2zMoza5czS6SjnBY+455TX4+3Qo4imjHg/mx6PnK5AXt
	VzLF2lj/oPOdl9Bw3LS5FFsqENpc9cJGj8tldvhefiyxGXTWmXJFmrgHQ1CfdJakRler7xHKZee
	ApeGaEdDle1OTRmvHyf+QzgfLri5wrQRNDg4dWa59GpkJx1vKS9ZFJ1IEzfWyJj86KcArNu/HMe
	e29g0lieW7uU54254aZBMi1RU9BesduKXyYzJHOIPTlOelIkF+9ppLI9DjHky+6YcUNRBvV1eSL
	7cSTnT/ljOVSQcLg=
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836537485a.67.1789978039831;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:93b:d79b:9a62 with SMTP id af79cd13be357-93bf57b983emr836534185a.67.1789978039250;
        Mon, 21 Sep 2026 01:07:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd2bfe3dasm91475615e9.13.2026.09.21.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:18 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
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
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Message-ID: <qecwr6lfb53fjjsrloakyhopeavi5c7bnskwuoyw3hviizp6me@fj2zhuxwphc3>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0e5b8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX/m/uxwBPzIRc
 ayOk6M4MGChiqL8hLr46FJQNaKNuRLrpMq61YLkxi+bHNHYX6jElqoVhgwoUCK+z1bGhb5UpZJP
 H8blsvdEVujZqlz2apmWyCPrJiML5so=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfXwxDRFl5vXg8o
 yXoIAfuVeHdYmnGC8EX3uuuJninDJ7cx4lpm8nQwIJRKFWsR0hzfx2m5cwvojgqA4368HOki+MO
 hoEQ89lbal4C0gZYogJK1dbCeZQAvA07iL8Xw8HO162rYbLyeLSyctxxBgJvIRQ0zgXbYL4q2DK
 QAPVWP4wtvwJIJVct2GYlrZJNPrYSp3UjUQtNCJB6xLPV9qrzi6+FT6Tww5Ix5NEl4c5oOwOek+
 +dNZQv12qNTx2vcdewZJZpNlGgHxCf6ZM1H/yJacJyRi0kGwhAG7SpYXUYAS6eAhdtKwbjht7ZA
 e6DxshkDEcnm4cpIkp+k7cv0ARv34Gm9Io44KzVa1MvEnLs3Ub9Yp4WWEdex+des23jL5S6tHdg
 Yr9X5j4qTVbSuQqkH+lIPmQYPZYPwzB4xxU7x4aeudI8+Z/eKAKHenLxwLG75g8obf5hh2LPdRs
 7U2XDp80fQTIpZfkBAA==
X-Proofpoint-ORIG-GUID: oUfglt7m3sjENBXGYwK2SDMJ4MfY88_R
X-Proofpoint-GUID: oUfglt7m3sjENBXGYwK2SDMJ4MfY88_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-19 10:14:58, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
