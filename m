Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207908;
	b=EKLMznuHXYF8KOe5Fw6R6omEQyD4DgnISGujQxniA75hXhOxIzVUzeqlV0yyDbStszGT
	 iQ6AvH+xj3CGXviGsjMWdhRpSbbA+wzB7lCmWQ0DiojoB1gWK5QMxta59Z/ct8VrWnGFr
	 sLYq2zRGLds6mDZxbzqu601IkyuveWQTqgn+IZZNmhvxKXWkhuibqAqBh/sunA00CjKKn
	 Cof6Iv35Go6yan3dE9dCym1D1yz4AiJAdstG3Y8QjsRWNVWT/ysLcjLH00ATXCkgyijl1
	 imrH8OdXCkfUQd8zR0yqsiQxL/NqploPLFetlBmFeMm/+1pT9/SPv+XiMnhfPLv/MZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U820FuiJk8PT3EN3MqNrdqNmsP/q5hz3h1B6G6YSSPg=;
	b=QiPzuI6smq4zrJDEerwtAmxyy80EmLO22pz/7raTIDKaVa7si4KzdwGkMPMRCVnc5MEM
	 Pi2D6776Q3InTiqfjMZNlh6cC7xDblnHdkX/ja8UbVFGg++oBNWYL2wjiZFa9lCbIqFlc
	 qaTBKUGiOqWIUL6ZI27s0sYj1FO0PFFrp2WFSwKNPyT9rIhGyzNhIltkB8tRr7Ab5JN8T
	 RDV6gCUNvYT1+qQ05ZknVf5Tu16G66vry4lkgyXoAc1BShRXQbbRf5UXdf3XvWW4oSxH4
	 z9TSQRgDQEqRpBgVwZ7dNn8t27Ce1FLayfEasNVX174Yxv182Xv1jQ2jaGWyJ9rs+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TW9M4pDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JotuTw0o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32D606A6B2
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 20:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F32D606A6B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TW9M4pDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JotuTw0o
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfgWW049068
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 20:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U820FuiJk8PT3EN3MqNrdqNmsP/q5hz3h1B6G6YSSPg=; b=TW9M4pDwMjFwqPeU
	Jgqois8eOV6b0ny9uaDLw2TY60X+Npr05SkLhqEcZYe9BN93K9W2Bm6+V3S7v0ly
	Auf/+7ukKesOrE/RV8jz+hG+DtQorAKJQUGgK55f8WOL+Ss+hvaPGevmoZwZFHCx
	6sr6t7UbiFXJ6VoMmUjwQktET2cfHDD+Fbztrjc3aRSVQcTYA/Jx3Z7a56Wx+ZF5
	uCmIrPoq8Mzyose82qeQiRzseOkN9Jb6zlWv9smKQj0JYVvIDIA8BEKGiXJwOUJA
	3ppjN3S7NDyqZRPjDQPMADmGRes0Un+dN9JknJo1k1iEvpPnt0quh1+UltNKjh7l
	xhN1cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4jdu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 20:51:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so234811285a.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 12:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795207902; x=1795812702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U820FuiJk8PT3EN3MqNrdqNmsP/q5hz3h1B6G6YSSPg=;
        b=JotuTw0oKaQOKJ3kFOQdnYO43UNA7Lkd5AZ9y2+8UgOZmsupubXagHBK5MhTiCNEJT
         HmnNmTnX0TpsUaQrZ8bTayDxInDX+lTkP1FJyb6ZLTMEy7uQGx9+UeWV9rUY4bvldzYW
         N+U5xE8rXIh/TrKSzmlvhZU5nrg0NiirLGF501YvPAWyqfjlKDDMQVg4uyY01xxapwR1
         oAjKQF97hOlii6C7cNs6lN2D0Z1XxwwB7l4YY1cDo0bud6WCFKoMCj6xg8RbJHuFIQv3
         8xvlajY4WQBXddda/CizWgDOYLcMuV/Npu3b7VfM0HlIBda/L+vOmUzRWo1rYFuG0vyZ
         VWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207902; x=1795812702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U820FuiJk8PT3EN3MqNrdqNmsP/q5hz3h1B6G6YSSPg=;
        b=lP9ab0TpsBZi72jvS7XPx3o86So8zsu58FpHMTW5mSezvCeXDDxbf2qGDSOV1bJ7xO
         IXYcrooY2R+rqNFoKjyMfYtDpWb4fAh8X+pCb4ILfYmir9Jk973b4leYgkQJa7eDnXXh
         oEw4YKcoS9hKLMkT+I6KRuSih2e03fuzk/ezFdbqhbeUZv6OIyPPtUDON5q6SQnI3wUC
         lV/Xhz7LB9anliqfGtOgZCmBdIFQTQLDzfMpB3M2LSsd5xJ2dh2q8xMhiAS8VefMyY0V
         YXwjpyANUgFKpGlDQGhi9G7eeMO3qDgPRjMY2ZAfrVRG7kFFI70A416i0F2DmLgDgzyo
         X0cQ==
X-Forwarded-Encrypted: i=1; AL+hErEoCl4+nemNoeukE3WC8aEVIHGJCKHk6QDlOxamXgZdeWYmvonTTYOHNuO9AXR1YZP6MUbPdfFSewmeJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9RPn6cp1OAnX6IDCtZJwABXif87DQqMnZVdm452tpikFUJ03vi
	5T6is4+dbz/RfP8FMlIfIQS70WxqS/6Kp6jNOvSPZovCUbgyxvVV2AzQQoq58hSo9DQGJcg7Wcl
	qIoaGiTyAnoVr4j8wtAciwVJnBm0+6ehqlZWvBChQL3l1IYGooC7vcoqve2Vv8cubAeUaGdt2Ew
	==
X-Gm-Gg: AYBFou3Pc7MBBELTQl1Dc9vTWOR8weN0RH9E2IyW4C3/9HAs5qCLBRQGOsvBTffrya9
	RsSKvjUGlt5OKJ7rGWMoVuMX63gPnaytSVDLMPmoHhV6rYpICcGaABggJDlaS26LfwYDuSeWB5h
	jrJ+fDc+nD5qbTZcfcWSMQdqdi4KxMkFZPgw44EtgdVUs1wCSJCXL5IYzR9zkVn+kpATQQ1UCJA
	DI/CLOd8cAxEft39GeLp9IGPA+iH/bvwicHU3Sg1iNEkHIYefaINnp22mqxlCUk2j60Ajydmf1X
	Wrpd59PgSZQ0AgL1ujrT8gOyJlKDOGd9RpmrNBcA/9I/DAuLhxxbTi4YTLpqVC8jhjeMSHogAHG
	aPYrbI+BqmwFE0D/+DkS2pHyxobaI9NYRpfA0dHfnWD8UYKlfKvF336j3PMlgGazcLzUUYWk7zq
	YdVVnf3Y33vum8
X-Received: by 2002:a05:620a:4403:b0:947:7f9b:f839 with SMTP id af79cd13be357-949ba9bf10emr710750785a.47.1795207901685;
        Fri, 20 Nov 2026 12:51:41 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:947:7f9b:f839 with SMTP id af79cd13be357-949ba9bf10emr710748485a.47.1795207901286;
        Fri, 20 Nov 2026 12:51:41 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm103013545e9.1.2026.11.20.12.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 12:51:40 -0800 (PST)
Message-ID: <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 22:51:38 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <cover.1795196107.git.jesse.casco@gmail.com>
 <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DBf0-SQXFptdnRwfIeN4ev9b9Td4pkNH
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b00b2de cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=nvFhTvURjgvQkRSehrwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA4MyBTYWx0ZWRfX0vSmWDQvt2Cf
 eK889UE78683/gIPHJKS6EeOlbPtzQv3GpLla+HbMLUKeAk3qfI7Uv0FZLcs9CqWhpRz5wjMahN
 yoPpfqzuvNd2TXVAea/TdIjZoHOnGJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA4MyBTYWx0ZWRfX7ZvAssmyDxPs
 o1ssHdgo5NIu4yc7ROKoLCI9ganZu+G2548TpItVi8959Xd7Ra4vplAacqAn0uH/UYE2+Q4qEr5
 bDXtLlq9yNOtKGHeMYIpFapsgoIYN/f/K7bOeT2tPymCdgGPIrsex9n8ClKqJT37aVK5OQd0/st
 rm2iWFGDrjImW645VzsreszpRr4ExRm/JPeGXXjEDpl5bTdvBv2C3DCnodD0izDDVt3rCruePMY
 uFK6AD/ok3oc79SjwxTfjw8aD/HhfVUw6MlYdO5Ok909zb34kFDwo0ST2kfh0duo6eqsoVXeF1I
 N/vznzNUgCH5Df5cOUhBgFKGdsz++S2t3iGnMVzvx0e8a4ACpRqB8HbgT2AcxraMkIgOD2MtwUj
 xYBEjbJD26swivmlLcpGQhhSI0Tw6cu4zj0py4hH/ykl5fLA9xUwI9KNyG73eWs8uyObzRuXGmQ
 2ecXi3SKM1hW8cioJ+Q==
X-Proofpoint-GUID: DBf0-SQXFptdnRwfIeN4ev9b9Td4pkNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200083

Hi Jesse,

On 11/20/2026 7:40 PM, Jesse Casco wrote:
> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
> a CSID index and completes the buffer on the VFE of that index, and
> camss_reg_update() is passed a VFE index and updates the CSID of that
> index.
> 
> That holds as long as a SoC has the same number of full CSIDs and full
> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
> only two full VFEs:
> 
>   CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>   VFE:   0, 1, LITE0 (2), LITE1 (3)
> 
> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
> fails to stream with "Failed to power up pipeline: -22" because there is
> no VFE 4.
> 
> Look the VFE up instead: a full CSID feeds the full VFE with the same
> index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
> This gives the same mapping as before on every other SoC.
> 
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 7d9622097..8020b675c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss)
>  	return 0;
>  }
>  
> +/*
> + * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it feeds
> + * none. A full CSID feeds the full VFE with the same index and the n-th lite
> + * CSID feeds the n-th lite VFE. The two only differ when a SoC has more full
> + * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VFEs).
> + */
> +static int camss_csid_to_vfe(struct camss *camss, int csid_id)
> +{
> +	const struct camss_resources *res = camss->res;
> +	int i, n = 0;
> +
> +	if (!res->csid_res[csid_id].csid.is_lite) {
> +		if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.is_lite)
> +			return csid_id;
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < csid_id; i++)
> +		n += res->csid_res[i].csid.is_lite;
> +
> +	for (i = 0; i < res->vfe_num; i++)
> +		if (res->vfe_res[i].vfe.is_lite && n-- == 0)
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>  {
>  	int ret = -EINVAL;
>  
> -	if (id < camss->res->vfe_num) {
> +	id = camss_csid_to_vfe(camss, id);
> +	if (id >= 0 && id < camss->res->vfe_num) {
>  		struct vfe_device *vfe = &camss->vfe[id];
>  
>  		ret = vfe_get(vfe);
> @@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>  
>  static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>  {
> -	if (id < camss->res->vfe_num) {
> +	id = camss_csid_to_vfe(camss, id);
> +	if (id >= 0 && id < camss->res->vfe_num) {
>  		struct vfe_device *vfe = &camss->vfe[id];
>  
>  		vfe_put(vfe);

Those parent device callbacks were actually submitted by me to remove
circular dependency between csid and camss. However i see that 
camss_buf_done is also introduced which make the api kind of mixed.

I will propose to not go thru the camss and those helpers,
but during the creation of the csid the vfe instance to be provided 
as parent device. Then the csid to call directly vfe avoiding all
those helpers which may increase in the future. Maybe csid resources should
contain the parent device index as well. 

~Gjorgji


> @@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *camss)
>  void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
>  {
>  	struct csid_device *csid;
> +	int i;
>  
> -	if (hw_id < camss->res->csid_num) {
> -		csid = &camss->csid[hw_id];
> +	/* hw_id is a VFE index; update the CSID that feeds that VFE */
> +	for (i = 0; i < camss->res->csid_num; i++) {
> +		if (camss_csid_to_vfe(camss, i) != hw_id)
> +			continue;
>  
> +		csid = &camss->csid[i];
>  		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +		return;
>  	}
>  }
>  
> @@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id, int port_id)
>  {
>  	struct vfe_device *vfe;
>  
> -	if (hw_id < camss->res->vfe_num) {
> +	/* hw_id is a CSID index; complete the buffer on the VFE it feeds */
> +	hw_id = camss_csid_to_vfe(camss, hw_id);
> +	if (hw_id >= 0 && hw_id < camss->res->vfe_num) {
>  		vfe = &camss->vfe[hw_id];
>  
>  		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);

