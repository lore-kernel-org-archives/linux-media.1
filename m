Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626396;
	b=qpZiTVbAIhPMO9A9HmYkJHGtWwQC4oZ773HVQsXNypdfTiH84mJ3zNz6sRUlD3WYTFMn
	 r6iJsPaYxMiDGMQwFh2epg4qnyafPgF8fpconJfeNGA4V3WXd0OErs8WDv2YkVrNUJU7B
	 tCYY3Z0xvRoCLaTuYRZqjLU3VIYiYpHlzZAB8LxaAI+EppyUC6X7TDUY4v3PnoUmnATpC
	 +MXRfOHCUfkCjEfMMKfWL+T5LnbwDk2pN5mHZ3SXsXqIcWMLBPUxNZjTnAIiHCSt/AMGE
	 wtaWRdz2Ib66yJuYywgSHVBY8MRDNXCBb51VJ58mkYILc5QmjgD9QfSpNFK7xizgcJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626396;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
	b=T/RHP+6xe0Tfb527NbYXm0B3dSNRdVom/8WXxtwhPHAagHLIqASckOPgpw/zrCZyFGdz
	 nEz0FLYeDZYhK5ybXBipC39CFWNYMfay3ALqBsvKndfPLl1ltxZXTmqY4y005g+9nilDw
	 owYwLdb0+SIdRmiiAmO1tbivXcErtHspYK0mCvZJJu+s3wr37DXtoNyEFTRfcU2t8T+8c
	 kDbVYihzRhefHmANwXeCYgVI8GqiBwle6/CZzCHsOlOj8/ZWYbNzia8QwF2+JvZ8cs5wa
	 LFRBN1zK1iNPyuS40uuUg1OteS1ybaFNuszSU6CwOFPqjlbiUhZRljD+1HltRKlNTxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB0606A32F
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05AB0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJRgvgs2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e04Nl3DS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAQC23423307
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 13:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=; b=XJRgvgs2K7pC/6Lm
	SZ36PdLYrisZ/czYvLmC49YHwxRf3wrSKeKQUihz6zD6Y4jk4LAwWrl43n9hbmfW
	J8IlAHd4S6kt23FwWReAxVDGrPgYUZE0J8CO0Ynu3f9DC2W7a/Ofedb+oyGWTq70
	N/BRV7TK/dQ/IjNVHYNZ6TS1o2b8/MLcyCFI49j1uc3U9PyT2utnUbzjo6PeyRL7
	wx4x8WZaSLbiSltuVYTkL2Hn1P+63eMdd4J8HUUIIRIcwf6ujBrZc4PA4a8W9bup
	n4EBZnh6gQ6fHQ7mVUqrfRrdqswuYLqKVdcT25N60JmpWU1zDATE/el/LTBpARhB
	DBv5Xw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh1hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:33:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5901736eec.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626395; x=1794231195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=e04Nl3DSbYAKPrkhaZFZF0oWYiClkp0edkG14YOd+lizqibM1IrcsNbdKfXtSARDe5
         PxVbUbnAoCR8FBe58g3qFfpOGUPcdal+XJXT/OnR5B8TzuzHmpsh0guSs95ZDZRS8ykt
         EGDwRglr6F7JIm9hmntaNExOo0AblRVkzBeO5ewRhdlw+rPOUVp5iiiB6TPojFCsDwQq
         OGbHqE+x+wl6Pd+fp03W0f1jugvO4LzterwgW8HNeH7DziWY+0ugff3Vcin7L5oZv/3p
         OxbNFj0xCkRXfHyBf3R4ltplemQrJmz7uT3tx4kE3/7mGM9AHj4pTTa3DqXGuTlQ5648
         9l1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626395; x=1794231195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aowsUPHoeJ6TRxLopFtshuzGGcc2yKO7O61+U0ZSsuE=;
        b=eDhBBCcYrpb0omlhjWeohItvm4Uar/OxwIme3VvosU3xt42qTR08UyLD5sKqnRhOZd
         FznGwN68Up7RFiA/pi847k8qzNipniq/iLr3l2osfo8yOL7myT0fWvBMpYpGVsPF1beC
         kW1rNXum0JS2kZdS8CIzRvEiVcy+Wd4vM0o2mi6Z7bds5kp80Moceuxd4uXza0a25vli
         Uy952Fl6uqLhAQEz4aRjkF+JlgHF9F7YTg/hJOuRETfCpYWxWgKM9yNUJXbiPrIIFPGM
         wjAbptAMfM0j05n2JBxN871Ju+CopxVTLlHf/YGqARltBOwF6vc3zyRTEjWG4TUAsJXS
         /SRQ==
X-Gm-Message-State: AFq9FYLB3lmWH9M3KdMTivWx/C7wMb3R/jmA8kylVj7p8ah/tjgAXnim
	3ZTpn1bOuX3X8+lRjp5ZeSTPcjyNPwI1S+7u47EdVENapAOlcaUsr3Z81Y6ksP55/2IdZuE3TnY
	/GTxGzlKyxVlT4Q4+dKz9xbmHytwqoNTjtjpcdrfqs2Dyi3zhhG1GvfyOLLA/Q3iJPQ==
X-Gm-Gg: AYBFou264+eJO9i94XtgOMMJ7fKlXUXPldBIoEAGuuAWD9r48y7bRDwwK2gunaG8C1Q
	MKW0qihEg4kHcpyqEKU0WWGLyOMHI3NPzO2WpjrFRmkBEuyjroCyDBks6A0rw3pOe3jNIoKiD9b
	bTEvBSoA0vNhPV03ZVZNKLa0VqtjA5R2u3CjCKqtVURKTzt4k4kmGzjV62JzXs3nYjFbfu15uvS
	92fYU/ChXlA2zyL+WwE65tQmfqH3/pmHK0ePhn9Sz9HPXnpgj1wrsP+D2oGteyHMrTcORUSH1DX
	PjAbvseyUP+HO9sRf0zP/l31kcG1Qqof5s8JLPjTwXlkXybzxqBsSN9rHK7QCl91aiePqd6Nwsg
	BRcHYePeEyA00YPaNQRu8jtn2KYGV8rJollFw4Dt/AmailDiZNte89B2rtOx6EflY8fmOF/OwwF
	+nOQQBIg==
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153316eec.11.1793626394673;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
X-Received: by 2002:a05:7301:6787:b0:361:306f:c32a with SMTP id 5a478bee46e88-36a42345b05mr20153258eec.11.1793626394081;
        Mon, 02 Nov 2026 05:33:14 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm36639936eec.6.2026.11.02.05.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:33:13 -0800 (PST)
Message-ID: <cc56469f-8f9a-4f89-85a9-d6f396ccd3c2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:03:07 +0530
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
Subject: Re: [PATCH 2/3] media: iris: Disable the system error work on removal
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-2-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae8911b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OnH3Zg2X3O9LORF0kDoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: FJ7apCiCZc75tq80pbt1smrFrAs16KWe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX9EHdrets1wPl
 oPyckx/SxFU4AML0GxbMAO4Og1FEwHPoYrtiOQakYpnMmjMkV4mExxlNu7FwuhpIQdM5VXDQF/l
 8JV/gzKXag80pi27mYOh15mhDVQUGjo=
X-Proofpoint-ORIG-GUID: FJ7apCiCZc75tq80pbt1smrFrAs16KWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0kLD78EUJK5u
 8EOhLPfTNxCSxMHd/lncRge/QqLM+t/M1NLc/6T27mEBE1rXFkmrWTcCDiq4B5YfrVhNYIaQypY
 SvB28dmWSUi6YXkqWXByQ1H4TGceHxQrQaSJ1SDnHgZlA68cYYepToeLIJJzc60IVc+DPLuYnfW
 AQTfrSkfRxjgI5WuohQw9u2MVLo1DkEFLamFQang5gtU9C+ffIA/u7fCiFnagdQ8/whAAt+QfIJ
 vZm/tkXZSuoGtVoBthnK20fNAqADCOkHp7OwRWe98SmsoCiiYOAiijZG2wtyrkUhjo+2qHGXkdM
 p4F+dAeroOqJ7YSwS+TSDe8yAEtilvPunMDYfIt1LvZHwt7oACVQKq+BQhFbS1mlrbm2f9uA3DV
 JdrrEpgF5xFLWoVu57SdMLJH4P0tTc8CpVJuSHZjXXboaeSFfIdxvNsUfXs6NKm0WbO0cIf2KpE
 zbfmRTZfftK7I/ipzVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> iris_remove() calls cancel_delayed_work_sync() to stop the system error
> work. This cancels a pending work and waits for a running one. It does
> not stop the work from being queued again afterwards.
> 
> A system error interrupt can still arrive after that call. The
> interrupt handler queues the work again. The work then runs after the
> removal and uses resources that are already freed.
> 
> Use disable_delayed_work_sync() instead. Once it returns no new work
> can be queued. The work cannot run again during or after the removal.
> 
> Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
