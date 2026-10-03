Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DCC28C5B1
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791002162; cv=none; b=RaONogYe7uwHl2lDqJLMxnD71DjZ2oujd8mbISfB05GPhMC44JABCMbHL6R88Fr3fXnm74Zafd0+yeryGM2N6stFspcJdFKw5tUFznRzU/SL9qAVWiR4CZL24TD4ZEZ3ZTW0zG0jGLn9OLrI4uf2HuwiNQSylbtEej5vmj0//XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791002162; c=relaxed/simple;
	bh=bCd7eq3BXAnK7U3piXSHOrcMyq5T7wZbV28bkpGeuqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9LzsrlL0nf2ZncTy+WuDoSVLI12KOhPf5jEBhsiT3AII5o9e8pUIWZHwQ5dp2CAPPBkmlYbtpFo9XAZgY0A7DOveUgLrqgOMJPTp4r18c9+PVSyJ8ucqFXrbDSey2Mxts1JkFzo1/3Vk10Qk1Lf0lSl3Qlh8AofgL8vXINdbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAuqpBks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bD7kMGt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAuqpBks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bD7kMGt/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933Z2QF3417120
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 04:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=; b=iAuqpBksVolr2wpe
	9IY/VWCYxYWrlYndx1OzSKFhrMY0Ty+2EO7E6f9OcEMY7fIIK2fSrQQGHYFSpc4E
	Wh7OYLcAc9tB4L2lA+AzgyOrLp4/wjPrYiSd1LO5J6FGJjHoS2FxBdZNLK9FOm/P
	JrU35RL60a/qiP5B8/EsmvRtddK6lyPjhQOJIR/D8ZfKtEKjzfzmLv4dyQo0Dt6B
	EPBD1KUul8UmqU3Bwv9vkfimsHDMSjSqwu2aonISrXWSnVrLGnrNURE6sxZMJpvW
	NpLO7AxfTVbXuwXGGykz0pRXxsaojRzC8SUAtkbdMPZaTCajE2405Q/rVehtkm0N
	liytEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sx302w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 04:35:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso23285eec.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791002159; x=1791606959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=;
        b=bD7kMGt/LBS13W1TnSy6Qf/2YTWtvs30h/YBgHqL7qTko+NIF9zlCmF+9sd+qCZMJt
         2LHRULwORtjLXEuEH2Ol56hEhtZ/5I+1QV6Rs2eUyZlCVZTeLteOA2COUFnWt4eHWEJ3
         Cwezu9w4BEbORry5BCHDnBtSS3q/vq8/LiMeMBhuWI5QeblfsHX3/TVsRuUdLGKYUGC8
         nf7ncctjeIXAMQEZCT29y/l+fsZG+nuX5Ka8VEIZuhaCLlczsaITqfBevbvubN6DYm8H
         QeW7caQs7fnd9brJlyiWrGL++3qsJqd90bxQiATjaDrMu7z1EeDax2/bepdKlolr2QAU
         ei6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791002159; x=1791606959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Gni+Xpimx1HzcnK+4D8GTpegyFf9CN2x+hfzGZ+jB0=;
        b=S42z7fxAzJbU0Pdbueww5ol90og3UXD1jC6YqrwIm7nUnvNRaqd6NN7NMHAEi1kuDb
         rAS+hGVGrGfv0uZGc70Dx5tDsmnqi1kEW0G8OCeQVRay4HwLjOc9vZyKm18rwQkZo71W
         IbSzbEai28WHg5HRLGksAGpooEMSHVR6XJvW+Q+c1t0uU2FtpD0nWBfR+sMf6LbmRKNT
         sDGbzA7K+T6l2ok3gw/kEqfMgWnilMrTmRcmX9N5n9ZERwS9UQixzo+rCeNIpxE7VuZU
         m6vbesDgtehrzN+H72iNRwf145fWoVGEBpmhVigEbNVrIq9l8v0Dkoz9iaJxumvxW+xF
         bbwA==
X-Forwarded-Encrypted: i=1; AKwUvByyotP7lYCp7PYOxZ+hPAFLPEZIwkSFeKKuanlkVqp0XgCC6IOu8QkaPGgxXYaiIf0J1M5K3wX8fEvyWg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJXF4tCDrSvC10jvllWEYg8gU7cjlTNDTC8COIadF1ZEqoK0m3m
	DH6FDW51DZzGo10NC301MANXClt6ePfQL4Xk5brU6mB+ZXRd6KTTRlwU0ZL7SDL+O2I1HQ2bTUd
	zY86epG0ERd+o67bkNReg/H+rt6jBUroFZAGBvJV7qxSbDcbFBvYDfINA4vZGJzVf6w==
X-Gm-Gg: AYBFou3KvoLqe63YP8cT2EEeOLWAy4TbF99+8ehW126Pb8RWVFuXijNRrBR496CPP1c
	OwihBineLBfIdWqHSz6qz5EqLVntH6QRiPMzbMBo+AOq1f+E5WhG9I/53wx2gD+TFbOMYheHJCN
	JvVCCKbqfHfEnxjL+r9k/t1ZU8U+f9hygy4CAuDP6EcMNimVBkN+S7kLbpR8yG1+//hi2AFMsGx
	LOIXKkcB4KaS9CqLZTJ3vN9MIzh/mfNk9ohG1lIJAc+CKvt37SgLNXSo4O3G/TxLPLCe6eRC8x8
	6W4qEfeMDt/KB66HwFu4Xt5GIDdqwyCNuZVqCslQfcRJPL4zEzZbSvZEKQM/HGKw5r7lPDef3FH
	hbGcIv+VXaCPOcSBCDxoIPV4MHwy1fA==
X-Received: by 2002:a05:693c:829b:10b0:351:1251:dada with SMTP id 5a478bee46e88-3511251dc63mr1803042eec.33.1791002158601;
        Fri, 02 Oct 2026 21:35:58 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:10b0:351:1251:dada with SMTP id 5a478bee46e88-3511251dc63mr1802996eec.33.1791002158070;
        Fri, 02 Oct 2026 21:35:58 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fdb478sm9685244eec.22.2026.10.02.21.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 21:35:57 -0700 (PDT)
Message-ID: <83f9467c-66f3-4ee9-99aa-96e64dff8815@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 10:05:48 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/15] media: qcom: camss: vfe: Add support for VFE
 1190
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
 <20260923-hawi-maili-camss-v1-6-cbbb42e534ef@oss.qualcomm.com>
 <45d79c84-cc76-4bee-835d-ed11ce07bf2f@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <45d79c84-cc76-4bee-835d-ed11ce07bf2f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JY0pPkKV c=1 sm=1 tr=0 ts=6ac0862f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=+9gQtCFHUNSz6wH2J7y5Uw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=dIRWhvgA580vZDZgd7gA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: WszzcpcFlR-5Woc984mqbkJWw-kaPeqM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAxOCBTYWx0ZWRfX20HIXxRYMhFs
 nnFUaqMGGXbehYSSexs2V7leuZiB+gW9gg3PHhHb2QBDxIk+efHg2gfMUnwpAxaTLdBiQczGZhD
 I9vP9VBn52Ox1xprjsKRuUQt0pSJ6DQ=
X-Proofpoint-GUID: WszzcpcFlR-5Woc984mqbkJWw-kaPeqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAxOCBTYWx0ZWRfX8hDWIGBgJI+J
 leRqvSC3EWPAwbDc6r6G+FkE9WV1iFW/GbUhhywhOziblNXsjbx2fiABNWErh1FvzLpaDVGxn9B
 0wQTlchEKMxqjEte782Sh6u3t+P0ijoe6YmNtGjcJonHjRnKZHUrb+buGLWePmfYysWKfmo96pT
 Fe2+ZseqvKgm+ZYOa8X3Sp14ex3tcAG6BbrWKOxyRsBfaudDqlyKKhVmbhzIze/bj8jTpTZAcow
 UTjLm14NDJOtlqUHaU5NeyHATiZpqY7pT/bU9bDfHpVgdtLs+rDCrYTsVb2WrRC8QX9ycVZHiHq
 lDjZSwsD3UCtIP4hfTxPYzvwZ6zuWX058JKM0p7/e8DkxYR0REZm3H9e4qIdSICK9xU+kU1tcts
 E9AuWaKLNF8to740i8p+yrFLgAlEhuc2L5LFFQEICVNs4Duy745NlIRwylpxgExxLHnsjXvQYd8
 Uf7oWEtqY9yw+TvLbSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030018



On 02-10-2026 20:05, Bryan O'Donoghue wrote:
> In other words VFE 690 and VFE 780/880 don't share the same write-master index.
> 
> So they aren't the same silicon.
> 
> I'll go and find the Kaanapali thread but the feedback here will apply there.
> 
> Name the files per their silicon version not some genX.c moniker, please.
> 
> It _looks_ like 690 and 780 will need to be separated so, I'd like to move away from this misleading genX notation - it may mean things to qcom but I feel we are burying inappropriate hacks inside of convenient gen files.
Agree. Will fix it here and Kaanapali too.

-- 
Regards,
Nihal Kumar Gupta

