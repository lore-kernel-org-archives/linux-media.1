Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34144D4868
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085059; cv=none; b=SjCf9q7LkfYOcCENmOJxuYlVpKmCxuMwrDk+aZ/0IXVK08kjpfNTY6lbR2Gt6EKlIGeyzMxNe3J61PeRzD6K6zrTbtPOwPVylQv6rzXoKeZ15RZ4NCWzT30bsbO35G26sYMgaYuqqUiXs1Y24gVLfadbsDeVie8Sfada52yKIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085059; c=relaxed/simple;
	bh=b3RR9aaC+6ZzRnzpLfKhy/x0La/EHaE1+EBXTgchvlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tU2yzgcrd6CWT0+yBXppId+sy7E8SPgTtZGnmjTYqk1e9i+somyafCnHm9wEdpQ3uLUWV4fwx3O2tdrQFbk1TCb7nvR2C4pHZsE6dnRPbgRXnAHMuntgGmD54PhYzH1c1eaqGQsQbI+4UuYNgZ9Fj85cQdUctptUz1KOxxsOSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUz0DW+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kiZAQ5aS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUz0DW+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kiZAQ5aS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPVSU3516077
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHyQH+dBoD/yYmLrvhCc1mkqZ8k2XX0haCxzDDCcyRk=; b=YUz0DW+tWHlHQ5AA
	LhIp2Yujutu3dw6caaMRQNoNNOmm8LUOUqRhA4HHSHeksrMsY1gQNZsJ7EuOMgOb
	HO8T8TEQYpoyKt3l0zrhAkYV+PVuurh9TufwYCbfeTsbwqdgn+pBdXQNem4X3TZb
	y8dTOcy32pBWsMVrNisV3EYw5Kp/jX0gnB4S0G+DmhhrD9YrHz3wAtBNlFC7Uu20
	Zr3YIBr2Dswe9taKp3b+QpY3RyTtlp8qIHoepkehRU92OLret+7jHww299J7ccGS
	7xspp7k/kiULRYNMUC+XprSyXbVARpJvraHkbTuoxIikHNou+ndc+iRkRP7nYLpt
	p8p8BQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqatbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:50:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8688139460bso4516400b3a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790085056; x=1790689856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHyQH+dBoD/yYmLrvhCc1mkqZ8k2XX0haCxzDDCcyRk=;
        b=kiZAQ5aSKNNDl3M7jRJq6EsTmN6ZQM3aeRhRlMRX7t8b8tC/cbOeat3thTkQkr9/zt
         34Ydk5HvD6orwlWLYsQxS60hJU2jabqBvsyrWL/l7g2ZuowDHjuwqVA+sdBtpEJj+7jd
         8d/Wpzy4Ym1tmy/GYzPlt+gmC3X4Mf2kyFQSQ6EUiielGNmcQ/+pah2jiP8g7SiEAabO
         qK4ocIGsF8doHgGNcp0ft2y4FmtpP2JaVB1becezxE0WYZGJFAnLdJUWj3fr8Vy7hG5r
         3eKnVLwOq8LGegdEjbdZnuGJkYbXZFLLDCzMziEMQ60p1OFdMmKoHpFFUuNBVkBjhrBM
         9Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085056; x=1790689856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHyQH+dBoD/yYmLrvhCc1mkqZ8k2XX0haCxzDDCcyRk=;
        b=h7tWKIoZw758wGcMFV63g4xQK6v1CqUv5vvt2FmTkNDVWJix2KY6Hq28kZDjCH6Xe8
         npW+ZgT7b7ce66EfIwHnmHMl6UWid7ZA1BBI0plcVCquq7F3HhyFc1fuRwxnWdWM6Vqm
         /dOCG7QsHcN8xqwFPsHQrAAdoQ8J0TkP3iWgpHsVF9wVV9a26UugEbIcyoVL+lB4iW5x
         TJ/raDX5n3wvN8EKBjAXIUpLcnT20uJ9EKdx0j1l4FuiGOk3CVeBkhejjKzUg2Z+RKUF
         FU4Otii9WlHN2Q1UEFzn2rNRTp3QvcR4C8jKhKFmbckSTnPhOWVOV+VOXHrVTOnoXevl
         wOQQ==
X-Gm-Message-State: AFuF++lGzJua8/lTCFNT3dxWxESxWnxFrnjf4JdQ8JiOogdLMZwdLh7I
	QZ7C4RsmVDkZMfT0FRjFnQ9RFoaY5szIbrhdt0bB+IuBMehsB5B5sHzdsUIRggNqV/jc4i6lBSb
	pwpPCuL2sKBSRnOXLAB6xehblbBiFIDdSTqSwlbLVsQcWk2ybJZpKujVTXN43l1lpOw==
X-Gm-Gg: AYBFou3gFXZ1Z++N8ycTJ4tggQSDWSNZvei+Q8LnJBBuySSsUcHgn2HIJr5vGQa4ric
	3gHAN8MqnH4PObhxb/335GMqnPZPwJsKla5ZSDYtInZc0rajK4dcwT7nWlaofJDScTI1jxbczHG
	+F0cF2qRNUCppw/3tRfZ2TzoKl7PUNWfXYrGjzt1KXRMKmbVpqyxlYQ9Fji/Ji86v3drJV2QHlG
	8EXNx9Xmpq7TqHTLdMte8e1z53T6MtwDl6QqjpyiiP8NW/gFzLbvtl5a8UyWmEZpu7ILeNIWUUQ
	gX7kC5q2/rwnlw2FhQWSlWOJFEdeJfVMSNiI533jQwm/CYFVQTODvxac9VZa09hUbypfFQn6Opz
	tVmXIPjH98NvLrdu7dg4hc/QoNL2Tns0=
X-Received: by 2002:a05:6a21:151a:b0:3db:2c66:6638 with SMTP id adf61e73a8af0-3ddec5cb9ffmr1573941637.10.1790085055653;
        Tue, 22 Sep 2026 06:50:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:151a:b0:3db:2c66:6638 with SMTP id adf61e73a8af0-3ddec5cb9ffmr1573888637.10.1790085055024;
        Tue, 22 Sep 2026 06:50:55 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75698a92esm1022159a12.1.2026.09.22.06.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:50:54 -0700 (PDT)
Message-ID: <e86a292a-58c5-4abb-b7e6-d3b61eca55d7@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:20:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: enable pipe for hfi gen2 encoder
To: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730-iris_vbv_delay-v1-0-7b5a7953bcdf@oss.qualcomm.com>
 <20260730-iris_vbv_delay-v1-1-7b5a7953bcdf@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260730-iris_vbv_delay-v1-1-7b5a7953bcdf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4BhnRt32v9YtFTkogoXd73hN3aKtJVZy
X-Proofpoint-GUID: 4BhnRt32v9YtFTkogoXd73hN3aKtJVZy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX5uHa8kdMt+SQ
 MyEjzkirj8uVnui3N4TZRHDKXDXqiCAZwYsHt8JJqXHdWmWYmw9R6BY/+6nq+8scIySTPeyVCDV
 fF+Yu6o6Ngwq7uBvvTPUE4lmrNnnY+U=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab287c0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nPNo3xGk1QDQ6wNufKMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwMSBTYWx0ZWRfX2aMO/ysR7TIm
 ETGLDgD/JzWvqt7//yDu8eo7ceEfPyxnorW1BbyW4JZ1X/EcTLnloQPNFTan+mljPQr92ds4/e6
 N+jIKqfJPxLBA+OdLvwQK1Vzm7xR9gJFrMHq4sXVutGN7279PfrgO4yFSGLuwwb1vlDG6YN+iIl
 HVrrEYQ6YVtg3Y4vIImm8IBZVTihJX0SkNUehT3scnKlIGPoTeART18O2K4YbOZ2NSlk88W8HAm
 OEVH7Z56w7RzmOdujb9XhAUoeINCNN+P/WREOObqtLBne9x74zYKh/ej1gQagMLOuuc2PIsl9WM
 NoMpUoRzQwRxUmlTcM0GWVJiL6P/tln95nkyGzJiJ6P9RBypz911CjMQsippZluI3U7xMqxZFwj
 yH4S9IF/u/Ns9hBMREOXRJWDV9zom+8ERGjOr7oyWekmvBJK6Jj0cKmN9T5NXI0zvJqJL0vHTQ0
 Abem9uZRkUi8EN7aYEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220201


On 7/30/2026 8:25 PM, Sachin Kumar Garg wrote:
> Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
> wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
> encoder instance capability table, and extend the encoder
> branch of iris_session_init_caps() to derive PIPE's min/max/value
> from the platform's num_vpp_pipe, mirroring the existing decoder
> handling.
> 
> Signed-off-by: Sachin Kumar Garg<sachin.garg@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
>   2 files changed, 20 insertions(+), 3 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

