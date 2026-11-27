Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811598;
	b=q+iMBwj9SzMxcZRsi+yH2zEJgVnJknIcjLF8+tkU6+KzD+GX1TJK35xkAtrfZe55aC4Q
	 uGd7ccGnm1WNA7ATk4dR1n3yjDBElnnPPLu27Mf2RjQtq4L9ma3l4ZYWEzJs8rPbF5Sdr
	 BJJlxcsU44RQaXB8sjSSMaWsmvwwrLjwsYRMcb5aM6ysEOZIMtFfxPT2W4dfGesJ/26nB
	 joUXCY5jsWf6MdrZNe65lRvv72G8GSzHphQ02fPTNSzfgl+V6HJM3Yzxb7x2GDaeKmJlI
	 5tSY38UBI9lLApGZaqBr9ex9kRq3Xjd+0RObqdYlkPyS49cS61nPNPls1zgp7VSSoNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
	b=vMxkNBxIpCPFiQtDTr5maonh8bSms5FJYKTwUDYHUAZUCWLWUohCNP1LEkNUmw6mHJxZ
	 zMIwKlXzh3UV0PoHg5ZwKVn/Cr0eR1DsavksrWt749FBmHO5eBwTeLCI6OvpjGqr4i0k4
	 Udskqe+u2IhrKVVyBXal/872Cy5H0a2DRJKPkFS0eNF2UBoSlldkucDsiLv/plpWCo/HF
	 tlrkpxOSLfObAqNUdbMsFFu/9wlaZYGqIN39uhiQDPeaXN7RPHXAAS3Q9wiJD4kG7eXyr
	 15pc51YblUEG9BfmEpCsp93Hf4tlE5gIgvlU22gzXK1aNyHvuR+EZuQAmWSCA/VEtng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63891606A321
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 20:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63891606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VRCEiFxQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RfLkCp1T
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJApWR3347106
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=; b=VRCEiFxQxoYOSGdH
	G3uZ1VEiry+ezdUhDv2m1BlPtGH4U79T9/SHHUFOfYsJDMGEbycdFMgqrAbXdSzb
	jsR3KkUidJCi7snQ570dZAFH8G0kVtGh0RWZgMLWJj2CVqt+KgEtXE+OzCD373Pd
	R4ukBCHKd7AJSUsrYqE8+c3odSq7DdcVSwtl9IapAe0BAwSW+diXP+aZ+g6jyb4/
	+ozGPES8mvhWFqcW5bdAe5dLa2SIZ7kLIgY3p2UaPquUyah9a9AtEy1t/AG5VDJx
	n4HFlryr6rs3VgQF0o4GsvUf/SSq7vfLoHZoQUQvsOtGrWRzRbGhBsTicNeFwGsu
	SMQmOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhk2hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 20:33:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9496ff065bcso1126312985a.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 12:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811597; x=1796416397; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=RfLkCp1TPpuIe3mQB5c6pfZU1UfiQtjEWEYHA/KUkBytAmjHX9U+JyVS/ju6Q2YQTI
         v17gHESlMBMZppfDQa2CvFdodYKo93lew03ThnOOsesuWH180UQYJQ9NoPKnsZLEGUVb
         LKtXeni2dlsZCi2/M/KR8wxzQaO1LrzffNfbCq6MmelniP2tNSpgt7a8z+GEd4QVcycS
         l1U/IR26xDCy75flcmkI8oWnsD2VEDdpm1p1Ao2G/TVzDxjf49n4kR2MGnZDwU6Trhy0
         KVMxqIXFUQLHVRiw/Hy5pN6a2dykXSL7xcCP/CCIJaO0Z3Ix9iC1ufvxgWFdqhptYFaL
         VgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811597; x=1796416397;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE6APqSPwegjZuVCbjiuVfa3wRsTluXE7Utn5WMy6HU=;
        b=rEOlA8V0tIMxvcitN0qfGIYiZB6OwSF93YuYrzTnhGy6Kdg+EWKN7Ymqo6BEVCU7MS
         2zwcdY9QhrBGk18SDk/h8L7BW4wigTa9kezNVii9GTc1mBRstcy/elYyoRi6KUs+99em
         x/MujZ4zqPU9Vh7L+tw5svc/ODiycUmRRWWx9yH7PftlHeQb5mV9pcVW2fGwgrj/DgDV
         GwEa0CHd2SADlFaV+5B5TIj1+aeoP3u18l+tJprUgXv8PxK7JIs7KCED2wmnXZsv5shF
         RMsmqg68ww90qDxU8QMQ1HGa9YfEWEOnr6+UbFd3sAOPC1KTnlidzv9wdXLdaf6gvw1F
         SE0w==
X-Forwarded-Encrypted: i=1; AL+hErHAs2FrIGVeRZwe+v1s1dwn7DkE11wBy4lhQ9F6oBdvDScXpQxN2Q1rYJPfwAZrpWTnU5kppiu3c8dQaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Zb2ZZY8sHCfYxJovhMfo2Jujh4ZIgQMEOZRu2OhVz5WIdBUD
	gGy4sIyC4CfFEQZStJMo8gQ7woVDnUyva56bN450l2f8SM1rp++6u0oJSdZ0tkW/ksfKLYRSS6q
	QdFDXy7EvrUpcOwOjqa7Mejdm+YG5bQQe/2itFGXTi+SNkEMF1YXshiVaOxNpBlID0Q==
X-Gm-Gg: AZFdTZcB0F6Yfd0lgZr9pS3vRPQqNZP2tvlblaN/m9/upUUSrw62uz+Y7nlNDa3dv2B
	rW1UZYgpgP8XEQqKFq1ue0kS6utM2tInFiR4yRt5kzVpw+L/rSpOYdIO/qQA7q+gBOFTwqybdh6
	l5rzBklKLOYcDCeSuRL9SYv1fR9ecXdQ7yjlzOqel/LZrLMlIGrhB9EaglG5TJxGYHbKQSt+WoG
	XEyVfNv2utjvY2VmrwQ2Gm+RIv1bnh6PqH4ygH9i839ZZP3XsGq4bIJS4z+ERovN0NC5j21IOmB
	mbw0tWh/RvwKKP5XSRAOmcQjEz1iV8p9NNdyEoYXMkBrk/JJX0WxU2zJxCGGFieCIaTWkUfn7NS
	RCYkDiBKSt6eh+Fpq8G4njQU9g86n3P05PrxIQ+b2Y79Vl5yO+42FUrVEtypFDA==
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416937385a.58.1795811596734;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:f0b9:505a with SMTP id af79cd13be357-949ba9fe6d8mr4416930785a.58.1795811596241;
        Fri, 27 Nov 2026 12:33:16 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm757194145e9.2.2026.11.27.12.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:33:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] media: iris: Support HFI Gen2 on VPU2 4-pipe
 platforms
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
References: <20260915-sc8280xp-hfi-gen2-v2-1-c52075bc284a@radxa.com>
Date: Fri, 27 Nov 2026 20:33:10 +0000
Message-Id: <179581159079.3905807.7535868776116331018.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=454;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=dZVlzXHIaOh9wqFfQSZFQNICJwCt4yuBTslnH2BoLH8=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrCekKV4Omdmz5kzHIKBLrXk1+vAZNJb7tt04Dk
 GUa/EqkyW6JAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawnpCgAKCRBjTcTwaHBG
 +NaQD/9MPKSrOk2XJ9cGldG8chA0tmSFhTLp5rXvNQzag9wKaRzE+W5N0WYOqQEqFFqOobP7xgA
 NKXqh6abfoUmNVI7lkW01z7QYifStMCSQGgsI9iAB6CZxZ2TAsrEAdgKWIx3k8Gum74kJMCUCCf
 r49QKzBFeeXyVdQHB1dGLu1V5BUYjST4W7g0uV9fzDm0eCbGTjj3+z2xnUQaX/Rta8tiEksk61D
 UCq3+zfzlFswT2qPxTYPOqcj70ys9W5Spb8FaG/C53pw5n3uUcfpBuSvo3LzB6cNBZFNc0CQ6ET
 46fbU3LFYEEJ9kLsDoG2q5TzrJ5MFVC6arnxAV9XO/xjU9/w3xyDVlOMmthATF8LciRxfdoTT62
 kPChEZ1fAk/Ad7+1BFjd7AUKZNXjVqpJAwLHO9zhIF0xw1QUC5XbAdXHsy2BRFDAAaaDe+bnz9Z
 obWubKPeaM/xYfpD7wcXeGAO1XaqqwIj+Kq9VzBfN2ZNh17/V78dxEPwj2hgk/iP6GTLRyxs8i3
 Ewj5xKZTXgKGzW1R6Q38+9mKYjXQBpTeexZQUoG5EYpg089GJj9iNQsnO4DslqXy/j1X6maUlfA
 VqXZHrlVb9MKCbPlUhjFNLPyUIY51+ALfvbPKqesZJeJUV9IxU7zG2OiRLpR95NOEZU+ulOcUuE
 fcAU2Fu1PttGoMA==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX/y0uOteyw9Dv
 CyK1/DMH0vfIxui2axNqWCCi0unaFa/YFhTqHAJi9ExKVc3f9d02bzxym8Xbzh6kgqlWAr5Ka83
 l1uHSxo9IOjr1/Fpgci5M+vtzzffx0Q=
X-Proofpoint-ORIG-GUID: s-aNGWvWX4p1fpeExptOs9Oa6M1znx3H
X-Proofpoint-GUID: s-aNGWvWX4p1fpeExptOs9Oa6M1znx3H
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09e90d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=EUspDBNiAAAA:8 a=F1k60asjd3FdZ7QOrLQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfXzCBwtJsecEKK
 HmI8DNxZOT5ZFXnH/Pxbg4EoK0B4ohBWX/6zOuxBBFwSar21mDe/LYQrC2axcmrQS0lMUc8cP6Z
 ceiFlbygXjASFelSjNXnDnDZzSOT1ckmplqoauq6394Qs5x6Z0/7TFVj167q9FPQIUMr8/ivwqM
 wfgQOOLblOFXx4GUccSZMAYuO7Yg2IsBBxe0cjsQfKG/DENy+AInDTvyYNoudUHEzUl8ZFRkVUA
 cd8dWmPrMfQBr0SeDbkmpp/mCdZRyEuweyyMmSfT06y96D56Rfk2CZIfhymlWDj3J1tlV9tlMQz
 D0193JJHcb26kely7KLLQML8dG6Wm/i9mKt7rmpRoS9kNzHkrYVQu+P7BFkdkNtu6TSUOUKXATK
 DNaasv6kXwntkp4Er/+gXBfeYG3gjm8LY2xCANFsRuGGh7H75c/XhjIl7tT1uAYBJX2HOJUgkmp
 N17z0M8fk++AzqoCoLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Tue, 15 Sep 2026 22:47:32 +0800, Xilin Wu <sophon@radxa.com> wrote:
> Some VPU2 platforms with four VPP pipes, such as SC8280XP, can use
> HFI Gen2 firmware.
> 
> Add the Gen2 firmware descriptor to the existing sm8250 platform data.
> This lets every platform sharing the VPU2 4-pipe entry select either
> firmware generation at runtime.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard

