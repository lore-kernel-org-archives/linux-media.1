Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461531;
	b=uY/rKDuCgDJauizQL3rNvMU+exbfjeANpSEY9OLXemgENAYsE/xhwYiTp7kVQv2KS0Z0
	 icwiXAhymKeZNty0rZlIq7/D0+1biTmudV9iNYU5EvY5AqnW8mxmxKPuV5WpyrzFcm0UB
	 CNko2ABC4AKh9KVlf8i6DQaArPpgc/E3+1/G4AOHseqsDVBDSlQt5gmWLCuVbyfdadi5R
	 uI7ubD+sihu6C3vJ5RApXZRksZL6avL4eEIkAJ2cy4jEShuXtLvUDJVlwzSWucAHrFi6q
	 FdKblR2hsOwu7QaN2AtYAODjdjhofWnz35FQ3HfeVubL1ijgtRdJUROIslOzP+mAAxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
	b=F9CBIO56w+6ojSUJcEDep8BtivUhe9OzMgVI5y+cr3VUTPi/JEPlr9ipjZ1YQQrKJ4+V
	 gW89WDh0UxnRz9InihMXsm2dyQhOw5wiHQ3Y7usyQLSj44X4t/0ZS00ZhciVICltFMBlt
	 eRaOcDWTwo/LUdqryuuQPys4D4WBYuLLJZger4QWvtYaNMDejQD4+GXeqqCY3ZhXMM81f
	 Kq902yJ9wvbVjWE8XqUrLzpbyHsPf2rgXYU0f7xs69lvLERs2/HFopHZSZIlGSTTXUgcx
	 gLUoYbzllKMfCaPwkmS4KBD4clrwOJRXJeWCVHrn0+Pgu/8jckeAoyrmNK+SzFp6fEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493DF606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxTBbLJB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1lEl3211913
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y805Ldq0zOs7VHrpsV5yAaD6
	RgPx1BBPdzqAj6Loazc=; b=Uzw1GTOvs71GjbbnZoQOslKHhOfzZgdwsQk7+dRY
	d8jYEw/EYA9+lqVBIXAIFxRIzyf5Yy/mfZGJe0CZVZ8Xv2Z2JKkYT9IXxaDPE/ER
	hWdV00C+bYN++LgxazNM1aBbiAyolUj/uEKcyDXN0vqzUx+vv0zhXsA4Fyp7OHfH
	3mrdFTBRVG/70UVForVLuCiNzbjQKOz5tmWtCbhh0ItuMKMhabtOIZlXLCXi3elO
	vN/KJ8htE0i1q56G2gph3oJit+LIqBLiJ1/9fs3SuuHocF0nWacg2kQU6p65Px1N
	/MDkQo2gVK6YnU05PTG7xL6ezz6lRfrrJDGoyt/gSBMSYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr2ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so569048085a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461528; x=1796066328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=SxTBbLJBGFViykrJ8MrtAkKFQNyJwUXCO+rMKjQeuGjhLYs1+TlsRnBX1UvXLCm58n
         /fOqRxAS36ZYr3OJGWds7mWPQb19gKrnHrkh3j9t4lId3h+/KGIQgf5bAgKV2vsg3QeB
         OtJHmzR9tPbNIqppQo38M2GchJxjWnAdlhYgSsHg+Lk11y2TjrOmz0nwB1t+MDzpsEUZ
         ADJ8B1nWC1MkGSIpV6HfmMv9rQaDJCVjnrf9tBByeNPGY2ybGkWVjzm6Tw+YmyLGbcff
         6DiV1zIgkdyTdtp/7sKbeeZln7EOcerxeVyVvbZcN4ucVQhKrVJOoCMR66dpb//kvCoc
         vb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461528; x=1796066328;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=vRcRFhbJEQLDKI1mkpnQNwXWI/WuAT+SPMwV5TUQ8mtDWBXR/zpoI659tx0cdrTU/p
         LvKRapqfAJ9urJvRUy4JjL3Sp7NN0br33CXqoNgWgV+ocWFsKpen3f1MhgxGalXOWQ95
         /lMFQFSbXIzaXmIoqRu85UKz/96UZB+02VAnAAWs0gCGHJXKmvj6ZpoIoztle93uECnH
         WQ6W8GdYgL0Uab8Ilnp34pUM7xAfzfLzocpbiMDnfS4kD6ohUW1AKSwqDEPUW/67n5AO
         F61YUvj1Ur7h+IwA5FEGsN7d2QcQhH0LXC3OSjmv5mNoGM0bzQzKDSmJOxu7UwmA4ndG
         fa4Q==
X-Forwarded-Encrypted: i=1; AL+hErFQM5MihSRbkbKiQ9Qcb3r/zlM+WNbp6tY0KlEFKBI/7MmOboGOWYjT/JLgraJ74fn5ARrw7k7uX8C/jw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QkGqy6/rAKAtfxEn3Lg7p0eQFHmppcC1ZxAamqBwOdJFGlTwR
	2GnWHHx7pCKELMjf8F1t3WfHAeZUNbzXH8SwkENIYVdriNxKpzFSSrFYD58Pq7Mxoq0b18WUlda
	DQUn6VK1orUFWRwKNuurMjPtmZ8bwNnJFkGKFfHiIjAwP9S82Q+9xRalktDTqN+07FA==
X-Gm-Gg: AZFdTZe7HznO7is5sY1K5D9dXYmN3fCG/fMb8NGEAU/ylJ6GrPp0w8H8jOXevRgrbP9
	ax/vwVpUDcr7CEKNzsH6xBVvg+rwOm+t5adjqPdz3eO+rM2+mAl951eRS59TFF16j5sDhQ14ME1
	xR1a7fqDh1+bLT8XRnFqtgmjAzZeFZ7Ci25VMu79roz5MIdsvAKJFU6HysPkpivbpKkRFwIXJGS
	YGmWnBK61J6fHgFfiaqBxpHe4u6+v+HjpLbCUrgt+EEJ4Tcb25oXEkBM2R6yzt2qKK6eHvqUBz9
	QIDJvIZa+bJvyDztbk1KKntt60YzGnDZUVMmwRN3Fc5hPdD8qeX6w31AFPKlHNEeG1Acz37y75p
	gH8dIglO6VRUFh42b2jtKmsvy4ghZJPq2Ld67KuLVP0/+/yjNjfGFupeboetkqS6r
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228550485a.40.1795461528414;
        Mon, 23 Nov 2026 11:18:48 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228543685a.40.1795461527751;
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm144885285e9.0.2026.11.23.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Date: Mon, 23 Nov 2026 21:18:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Message-ID: <qdf5ekjjakcfjc7cpaz7zrsn3a6krlkktsygr4lvsunmrxyku4@cjbey6jruzhr>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+hSlTww3FRHo
 vAcrseiA9IDU96E4A1CR5bL3FfzQgRuDamZwxaLzsYEIYd/Gm9/d3SPmqttWgzu0U52+8C2fPR2
 jYNfqAMFZgqRsSoimo5UNzGb3VewFRisDyP8DOH2m7jlvNdnvIofHja01uzgj5Wb3kYlUtee0S1
 eCvr6wskvRNu1LtiPqYtECF3Fmv9MHKs9eLs+IE05VaS2g2dNDox8AV0X/hHURzuMm3RzphEpVe
 dtYZtkZ45eMsmrPe/SWAo/PP0FTvxm1C1SbVfn2cRiZW0RgwUU/QLmWKQWVp+KZ+jJPjQq+1u2t
 IPc+HPN+SfgdQJ/qnWefxnmhHMXSYU2Yv5+bN7RtwXcOadOoMoJIHPRENovVldvvJUc+TNnngH4
 7mwEk+qVbNrg1pxh+Is4phmY/rS7uj/lbz9mPI/5XIPqiYoaNWuVUWnVzeOFAyBUg/cMJ+bZh0D
 4R9l5sxxH4gv0STMy3Q==
X-Proofpoint-GUID: 1mh11xebFpXMb-V8Z_siNeCFwsoSiz0D
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049199 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ET__IwHBT81aRugf-_kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1mh11xebFpXMb-V8Z_siNeCFwsoSiz0D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXwWzb774fJUNK
 VcbKBXzkr0IRcXGW9tKWrE+r6XCrIso9RHwkzzYXrVlvqtOrariq/fQI08crcPvuR07ztG08Iym
 Oz+QJXHi3qxi8uHowXWQcLfL7RxZBTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 22:27:16, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

Please read through this before sending other patches:

https://docs.kernel.org/process/submitting-patches.html
