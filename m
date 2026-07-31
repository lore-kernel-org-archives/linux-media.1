Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E473F928B
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498459; cv=none; b=kO8uDvaBeUaqvkjwhKoDvprvfHPdlfg9Yr2NJLdEYWgP+AAzrrfv2I4BVSYGPkAYEQFV0zFprO2ODRwCL351vekraPu0sdzn0GCAvQiMGCZ/hfmGbd7Jcyp5Z2yCRAssICeKAzl32EoQLN8esh5PEgl8ZvZXE7xtMmpNI9XwKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498459; c=relaxed/simple;
	bh=DnhkgYMHfvCFu2QJMFO5Znf+coywQ8Bi1E6oL5tojWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PU+p7J+AxXFton/SyxmPe8YctUWqJUlZa3kaHITx9CDKR7tTUoHbcCLpiJYmvGLo+uwMy2doFLE8da+a/XS16LVQXi9tod4NJZxWssBR/bv1BkMBTDSfD1xvjyrpQ88c53zhitgV2l6GpRGljHGkyYApTcDDXEYm5RqSKb8mhw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ie0J/QDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2N8/qzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ie0J/QDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2N8/qzw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBd2DP4185652
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=; b=Ie0J/QDUSkrKCND2
	U31C008YtRYBOsu4hPT1zMqNx9Pw3SMjhw6XuL/Ea2fkJortvIbxgiXxmwdOiRBo
	GzFx069oSRe/CfpJSgjnW9pQcVZyw8J5fndZbpmubkTvMO0PsWwBsO54t4+cjDhp
	UAGvYEHC5RHr7x+wayBDdIMgDKDiTt7qQat4kopXRBpH6gUyxJTfVRys1IN18Tsb
	eN2c3NuJ1GNRZNxYonRi7PntPV92CDHCmehSnSGGGsWwZUV4x0ywS7hFzXJfYFzZ
	CcSmtgD9qU8B6hQK+tAUICse4bp3vty0uZ51dm6xsybBlmfH9N2kYLfZHY7qjAtU
	HEvC/A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1300xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:47:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90520763ceaso1607696d6.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785498455; x=1786103255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=;
        b=U2N8/qzwsp1AHiZESctiJc0AQIPvZj7Ati/q6RzFAYc5JKZOTl+nc0o78j7DG0cSmT
         rk73M+S2cSzKilHCHi6W8Svnl+DprxjyVvyinvqXU8XY5+TPWgvc+LKfxkQTUx8Dr19m
         H/FfyCwXkmSFvFEp4eqx/k3NsrABk+yMsHg0tPXuIWVwFNX4FQOPZMEIj+payN07NsjP
         iooDf6QTi2tywJsegHF4Go1SrvtR/efHdW1N2u8C6oYrdO2v4YHyzfVUXapOnTOJfe6G
         oulA4haF0difAsdyotQK6eMq/2TCPBScQsumpEqEltAXnbpoVynvhBSx9ZAmqvvH0U+m
         tu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498455; x=1786103255;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVtpalNU2+7OReB55Y0D7oXXvik1+l9HeGh0NADjc0w=;
        b=LUTAn+2olF1yDrsf6FD1mv1rO6BVI4nsXLatVpTtRMJ7CTrZcrEY1fL4S61Wi9x+xv
         ZafS0MNrMW0IAme1w2PLG1DJRaHX167ZKgQddNaRSM+wgjoIqFIQiUBnZZy1ZU92bC/1
         IBpiBQ1HmMfGxTSzEmXwbnDh9bmTSWfJYU2/BacfGlhON/86xfNxmf+zigOb8HAXYfcd
         jVod3s17hiZSEZU4ezfFzslMnl4x4p3HK6SL9TNZUv/0c1/+TQLqjcgoT173c71ezkFN
         a4Um/KUD9EIdu2zb49b2gPq28ce97iQUmsMjsOC2Tt63ljmKDkaRiq8taVoPtLv8rMaa
         /yNQ==
X-Gm-Message-State: AOJu0Yz0OkxW+3qKZbr3lfCe6K0Zt+capJCEM/WCwSt5ZTB5LL0m8EJF
	a/7kLaNGOuOqW8+4pOoYTVg8n6TTzfn12m1haC4+rl1WPjtz+yHyZqLoxqgYQmky3BwnrhQrP5r
	N2pd9mlt3vI1cfoWJ91QsBV5i8zJy/xT1WpKCChHalkf5Jp/0CXT5qDkg13bLsrgdpA==
X-Gm-Gg: AR+sD1097rJVi+J0iXu2mb7XMSRj5/chzYj4Q712xBViFt4j1MoXoaTEueUWFti09Od
	ymx3sNVK1cZmGe5Ervt09d/1KdgvjqjkvIppAgvr6Prg+SZt8L4YkH3MjasKeDvWR0nGlQcvgr4
	diohiQw/WdcszVFZ1GHuhTVP8+7XusARO1x52U5UncmvIXNfriPRKFb166litSw8tQOfMxlYA0m
	w8DnKuRYM5/rtgOuNSX7gqoN71uv3whwVuszCCTKkqD58V/rmjum9AGhjvZaVcDu410J0iK9oGU
	02vkDi22EwiNZ8qgwsWE6DCnVWhO+hMWXmbfxoygSCtcjsLWdZcmi+SxUHUVZI2V3HBtUuC8hcC
	eQ6bM7o816oFNH0MIUuiBNUWI
X-Received: by 2002:a05:6214:258b:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-90842433681mr23970936d6.5.1785498455045;
        Fri, 31 Jul 2026 04:47:35 -0700 (PDT)
X-Received: by 2002:a05:6214:258b:b0:8ef:4749:b1c9 with SMTP id 6a1803df08f44-90842433681mr23970466d6.5.1785498454594;
        Fri, 31 Jul 2026 04:47:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd452d93dsm129675566b.49.2026.07.31.04.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 04:47:33 -0700 (PDT)
Message-ID: <83d5818c-d764-4385-b430-ccbdb33ddb88@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 13:47:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: iris: reference count video instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-iris-fixes-v2-0-94c002016a09@oss.qualcomm.com>
 <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260731-iris-fixes-v2-5-94c002016a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX+A5lwvLT2zC1
 namH/F6m1lu08I3IK+akdnECk1+8fkIcMtURnfoKp470Ce4bOFVd7+PmX7xWR+3OBUHIwwg11vI
 UH1X4ulmGhUvsSBWfpJx72niEHYCu2w=
X-Proofpoint-GUID: awpdPI-oTkngYPm7-_clIRRRQCV5d1TX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA5MCBTYWx0ZWRfX6aagBp8lgyN6
 +FsAN/eb16TpOJ27qz/4EZxb88BFKP3iCvGdGepLxuVNaFtL32CPXYlUvkP5MnlzQ2hDiv64jSV
 tKjyeO8AWeuWa+d8C4/7/tas0UhErBKmceqe9R5U/Cmq6IW0yEp71ev64XF8SaoQXe9UwJDOtzU
 NMWFhXQ0Yql2dn2F+FEtLpta66cSON6qs8G16T4VdWmTn189JsAlBuInfQsrqaDeesrGBfzTQx7
 +p5//R+LFWxh2g8Byj68vr7A98FlLpjwBO9OUmirZBnAu4cr2+R1ham0BhH5y6T6BWCsmvJz9fU
 Tpogg9ImkwKkx5IqvkiiyO1Ca2JhMI6m4t3TpD66vgYdqXUF1TENlTNYpk3yyr/2udNi9sbzPWs
 7Ln3Zoo5p/j6TO/Q3Y8JzP0DlvRUST61Rl0kDJbUnJcDL+TcdzG+HsCiEDxZZJ4SZhjcx7iDiPY
 Jzvmc16Gq4FqFzK88tw==
X-Proofpoint-ORIG-GUID: awpdPI-oTkngYPm7-_clIRRRQCV5d1TX
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6c8b57 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VHsrxQYZaTBPj5NF5iQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310090

On 7/31/26 2:31 AM, Dmitry Baryshkov wrote:
> iris_get_instance() looks up an instance on core->instances and returns
> it after dropping core->lock, without taking any reference. The threaded
> interrupt handler uses this to find the instance a firmware response
> belongs to and then takes inst->lock. Meanwhile userspace may close the
> same file descriptor: iris_close() removes the instance from the list,
> destroys inst->lock and frees the instance. The interrupt handler then
> operates on freed memory and a destroyed mutex, a use-after-free.

[...]

> @@ -92,6 +92,12 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
>  	mutex_lock(&core->lock);
>  	list_for_each_entry(inst, &core->instances, list) {
>  		if (inst->session_id == session_id) {
> +			/*
> +			 * Take a reference under core->lock, paired with
> +			 * iris_inst_put() once the caller is done, so the
> +			 * instance cannot be freed by a concurrent close().
> +			 */
> +			kref_get(&inst->kref);
>  			mutex_unlock(&core->lock);

But none of the _puts() are under the core lock?

Konrad
