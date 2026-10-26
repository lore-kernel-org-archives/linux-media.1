Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020719;
	b=2ZYlRI/OzjoNQf+bw+sxYpcZHRxty318gM7Vaq57R+BW2pbGvSpDmzAtWnGuN87poKc/
	 2YtmU/ycGxfJh30ZXsjqlnD7LrmFMWsKi+oe6kGK4xjLm5OulBSflKfm76ft1coCrmI+u
	 0pJKiAFcWTRnE6Hb6xXzySM/FXL3hRr9G0mkXUZApqeKx2vdpcQYp7Ecdhy9l1cF09naC
	 /6fd3rsBnLFnqmtRtGrpYfq/N/v4Wh4m9HMH0lYb0sd2JRcwB7co30fYYjsJnP5OSs4Sk
	 naNJjucnJC9fu9AJ+QoJeldKLn4+1SxtkacAr62KZ0mzPPRMW61Aos+14pDRlGcLc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
	b=q0yQHc9J7hH/xV0TuYImmPculn2rwSTL/gGQxaArIERc5hbAULjEe2LsEg84cHrT1Xrg
	 X0H+PoZuqVShQnRIGZazPjCP4rLWUIhTNCT4VQ1HrJcz6oQiyciMnhpl5WRWvI3bHkNXN
	 Qrpk73SVo3WkUEJ0QIHV5A4dm5+CSV54oj/dFJeH06qdEWBL7h0xLnf0SMjc8ZFe6yk4l
	 WRBpiiKFJ27lVjp1/8oTxrImzV7+9Ec7E+qFQPCMSbnyuQb6fMMBapWx3R6t+Omguu/8D
	 a6JYxNm6Ud+OWX9mu1m7JnDSXXIjruX5AU7xRq2zdcrwJT5GiRkB8uIv/toSSTK5wHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE984606A31D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE984606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMdi2541984
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9I6xBe+KeKP
	pG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=; b=lnFzD3aTrzxPY5Wg/QEwuxiUK6Z
	B3ngorPNEG4sNKZf3iL3h63Y2nkJgbNshFm0EL3Mf590BdT5fU9atqCiAOAf/r2u
	qcQSrCk2SY3QnySUQG2rsyhhMYHX90hI+tmjD8RmT+KPT0HQOQCHjZCq1/2QKPNF
	On+7JvFdX0C6h0uwx/2W5JAGUzXPFnbJ8jIrYGWtrrRxbHXH/OCE0TQB5wjwNIem
	iapwoZvWD5V+5ytuFfCqsW+Z/HCKXgWxnhCr0skrWazBJzwwNFCfzI+qjh3EJe0g
	XQ9LQ8KzKubgz5gYfZ9U6jjH8pfkDnYF1i6mjoaRCC/Vmjw7UW+WVEOF0YQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdakbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so756408285a.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020717; x=1793625517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=P0OFSJTFSmirM306MS+S9otX9d2aGg55fpYmOAUnLgs04XVSb8LHQGMJYNQ4GsN0ki
         ODGTPtPhmFHoF+QwEx29V6ncBUxN4lidBGs8m9eHTzuQ2czFjib/+wcZyvleDozJWFwL
         TFuzZtJMpHufY1DJvYOD/s+udKmMfPrIYKeQdVxSPGl+zDVSGT2MafXQsG5zqAC2SfJo
         Jbw5MAH96jcuu/HSsaRfgmOrMAioElfroQp2C6FFxasHd1dvPebu+vLYfO6fmfr+UpTG
         0ktzWfTubfmp8s8eRUeFzW/yviEZ2O7Qtp4kSqSJDleSIIKlWj55/cGPT6Ni9Q3DYABf
         5b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020717; x=1793625517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=JoV4qo6ERh9Eud5Qh57AYZYVnCwpPq8kuKKs02Gl5mCCP0ChEkH++i/lb8l7+qq/7w
         DLUlvyRpgIyjdB2yLEuTiVCRqSfDITDq/VVicIUXBN+SxgJ0zRRiTsEpOIkupQie2CPs
         9D8U7rrV30gh/DPOVKBqTPj4ruNE83t7YcuPg9bBP/8BzM5yMHhDC/Jg5cvBPcA8Aper
         v2DLNGYKj62i1G6+B3xyW18XiKIKDIW1Xk9RW1jNsKCILJ8unPQ0lpzBqXQZW4C+lfvz
         Tj+iq1ymOEo2qpVYuKR60cWTtHsJpu4aJ+ZnUAxe1HEZ/CWN2MCn1mHxq3UsLBBnafy5
         gG/Q==
X-Forwarded-Encrypted: i=1; AKwUvByXIypo7qcA7cIHYTqC/bfLqEHZXUGT0fZNL2E+TtM7YNpj4tKmJdI5sezwpjTj68VLDYZFl0efJGN2tA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhDFnci2G2T4GN3zZzzYaVUQbQtyzTvThdOL01ZTqbR9du5IYZ
	Ry8iaaJFZTGP9kIQcyeq0LdjTHA5Azi3O7rxJLEBoTCokKSEes9/2dp564Csmqwm5nvyE1saXpq
	aSQmtNe3wNNo0WM6sDCN24kCmdCEpgcX1YXnrdgKV8SZaOPgzRH/0awhWbeMuW/a4pw==
X-Gm-Gg: AYBFou0dH2USVs0YdGdl0e+eU2BOsQLdpe+apcLkpJOlXLPaWf1xO0tZLsHcgrEfgAM
	P/I3aMnyGkx7L7IrTTHnS1uYh//5E6f6wkUMmHkYQ8JgZixiFrT/Oclniw+LKy34D7B+wBr+8QX
	R7yqeWGGuRtX9iZNHwfFfjwYg2LxW46MsPwdXD9cShN623MO3KDkK50zKfKZiNpGAElTOt8jp+a
	v3Yt7cFubYl+jClIrigjYfM9cvGD3jo0qCPhRk8Kyq7rxNT5Uxi8k2be8igXSgj5kfw7r3q9DZ7
	/TCqIEQm1w3dkDhk6C7c/8wF86hSTTJ6zAiSHnDEqSoiIL98aYrq36FQrb+urzp3JZ1AzBI8VYP
	cyuOYXrehNxkwy159tlT7FqQi
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031766185a.44.1793020716836;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031760285a.44.1793020716262;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:18:31 +0200
Message-Id: <20261026131834.3247963-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QLLyAtXIuLQMOnlD_cuuUuQrXhhgsXuh
X-Proofpoint-GUID: QLLyAtXIuLQMOnlD_cuuUuQrXhhgsXuh
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf532d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=CA_on-7weURM0OGBZFkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXw0K4cGQly84T
 jLq+52EV9dK47rb1D2+AvcOmMr/QY04nhKs+84lvmbtxd+blEcqUyjX6ZHRYyrOZYcD83KVFOFh
 0H6Jzs4JAVim+2xs+Ed+M5e7kHvxbfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX3VLywDmWL76x
 44pPMJ43T0Sg868QPWz6A2wYoFHj8A+Fz4kNSDSktUkoTqN8tBevsEnY/+kpqB05KWzJAG1vTBG
 ieBDjt2NKQGYlnqh6Mr7GorYevJM02+X/z1htt0ndhl/Czu3Jfcx6nV+NVUao0e1es+JkLvjOx+
 96IRr/w9a1yQoNT8DQINTGcE0lAf1md3rexk0U/q5h8xB786hH8T2DgyTWMUzdlSNLUnzBs18KF
 W7FCBK50DHBiWsaGKSt8zBeWjv/WQFPalszkcDBLxOVNNi/mM+aby9Hmsy/7zDMWqqR0hD+sCyK
 OA6TpvVYoWt8hK8ejPw030QkH6xANp3ZuT8KZbD2DUfuN6HuTreCzs8QYAWEKT9RPOopeuDZu7D
 7jzE1dJmMyxggisHI8XyNA65L8szOVXE+5rA42psjSLiQSlgbll4MKhghpaa0Vsp936oOG9PQHz
 RWl5rOdWKCBvN0niZTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On Mon, Oct 26, 2026 at 10:28 AM Loic Poulain wrote:
> But are we still comparing the pixel rate against potentially
> non-pixel clocks here, such as AXI?

Good point, thanks. Yes, AXI is selected from the same value, and this
patch does not change that. For RDI it is the line data rate (pixel
clock * bpp / 64), so a rough estimate of the write traffic rather
than a pixel rate.

A proper camera NoC bandwidth model would rather belong to the
interconnect work than to this series.

Regards,
Atanas
