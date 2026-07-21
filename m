Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DB147F2DB
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629420; cv=pass; b=bntgigCPznMqBqxY8cyed+XpyJtWRULJSdHMxGvVWtlJedFf0MhiLm78q7DJs2k/pw/8ZViLVcChMFe+5bk2/7p4bnLxERQeKSDLBruL+w82S48hydDBk4uNOMafnGBu7rwOgCuQRVuEjL3X0Ybs1Vs/C89DWeST8fN8Wxooeyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629420; c=relaxed/simple;
	bh=dAg65rfGUktkEyRGS6LHi1HlhBVqv2aq5WVTQI9cBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVFuSIpP5oCZliseBZnslSZMnlBgPZIlbJ6zySGIipevteCDaEficJJLwvm/NSo+cMbFwAEmrTDk4w8HKxmd+b21D3GYBF4r3XolomrPiuebvZVoL5IEV8GdjQ8C9hucr75GYK51frvhjAJNoEEB6vGiZHI2LcoDjSDfh1ymCfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkZU9qx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+9NFGkQ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkZU9qx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+9NFGkQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8iMXI037670
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=YkZU9qx6lnMX4N5K
	Do0b62EpRlotw+/e8mEbhWDllZ3QfTEvVcxyBwNAymMa+RQMcZQyFEuQy7fXxd9Z
	rWH4cWFfbPEGE74FlVO+pJA4iZDM+btPk9jltI5eWsv1UAL6mEo05qZHc0IR+y0z
	RJsUEtKoGNdiMaoLigiqBrxnJsAIW/jkcyEcEb2/Ff2hxrfXhIsfC3c5NR0SSa5G
	7y0HXEdC1VzjBR0o4gRORznyxuibrXiiQ2YD0U1oyc1mN4nSgSvfjlan7Iy2q5or
	tQ7kd/Y3Ni1XNudl9Rhgf4CDLVN9VCLP+AO3YviOI66wsozf3nEO/8J4yKJpE4ju
	0TPZmQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es1qh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6651da40ecbso4142907d50.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629416; cv=none;
        d=google.com; s=arc-20260327;
        b=T6RSQN3i/FqsB31uPqDdpQXIJsUvfqWqtr2iJlhwa3BWyk9aWSmgt5SH+V1Gb11eJd
         790dT6Pp/axVbRARikiNNGNZph7SiC1e/dEBg8/9JDSIo3Dvg+4Nte6g4rxxAujIC+0Y
         ulS55SlmSrWQ7mwGmh14Sb8EApzPnbk9G6j1nR0pr3qt818J2fZtwPojViDJxbL/rRvw
         OfTiwwHtTnrfmAQByToK648Sedri9rxGN+STjQaCXhIplEufEmPJ6bVDsEwYBdF4czvh
         U1marsGHy2Pnm86V16YsZDlRKkTfvraS6S9oX9gowJMNp284CBxjtiwfMIq+/8Rs4coi
         kqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        fh=3hiMUfLmRvBPxM2ye9YOyHgbAir79iZUTaxz89wYQLs=;
        b=fkSNwacR6eNHBnlbPKLslvy1zx+e8l5AioN90nF0WBIfRWpBON198Gpe8skbZUVzZn
         HDx2mvGGqgxfGgZIj8Qf4eV7+G17lDq9b1CrvP2QTBHvXzARTSGExmkc4I9LBOuJ6q0p
         FEt8t71ZlMYn6zR40pSexibWYodx0Jp9m2ICPwTDwpCvE93dRn+SwQeovUvpGPaFV9pK
         OJpYqFGWdDyF+czCySK6u7vp2hnVBwRLWeraQkC7Rw3ahmwPItVxMG2J3XgYI407Ub7g
         t92z3MEUMNmdsmukSISEWHhvnxqWcLWl1Wt6bgk4PofE6xMxOHUCgWGcIGV0tBCmM9K0
         xzUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629416; x=1785234216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=a+9NFGkQzqDbR4UJTTXL2nX41AQ2LKh+fb3qfJ7xzTcCnZBzuEjZKlsriGLROVw9pm
         02K8x1LR1Kg/31neA5TeGFddMhUCGGESNaKaTpwEYcNIZUqb8WV7R768NJmbeatVgpyX
         A36Dv5177kb3gGouuGkOGq9ztgb016vjqB6ihO+sd1TpinEOrexUaBQOBAUJmmfryxgT
         DsA5d9MmKIsZ2TbkM8/rY5Ugmn6dJm7rauTie/S618CWKYy5dZRCVgo8ITUA63G0dnZg
         CA7OnLAzpDL6Q4zGNcEaRacNRhQef73krPY+Djj3ta8RRnfdWv0UCqxMZY2395o2lRjA
         VLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629416; x=1785234216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=UOUyAGq87v4t5s215XNLym3yUoHxFNrblz7CcvstfJq5yJxqS2+4kCHUthkVy5ZDeG
         hobv3nWH/P0KLOB0Z7ptGpi8o2osYwBgZbUVPrKNp004CWuvfaR7jwX1k5u9zVEWrz0e
         Lk0JjKyFzurezsiQzQFc5FQ/5htHkCaQK7nuj+t9WRvOXnIvuuoVTx5sTD3amYKp0GWF
         2Lr/Vw+djwxgKdv4FtfgGxtFhm4yAycvhlpt30UbDdBN61vQmH0y6JTZtqB5OlRTHFUi
         YiNxza14fEEwvcdPt4UjvC5x009MmD6sGQQNSrhetvRl3+EhURRUJbh5aRRb6P56No1w
         UjnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIIhlei/hwEe0Hvwck9bXgWNyIuAbcdGeJ5F7qdW6kUnBynzrYS8cwB+HDd4qA1LqrMMhNemV0VrgmKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD7CS+atbD2hIC0Rn+Y7bVfxDGEqzDrHsY04Dp4E6Rs1rQNrZ2
	HwA3uNG2jOx5Dscy7Cc5XMAx78Zw9Evt00EiSffLiqTvRvK/KIkoTuzDzdbF/+oTiZElfCVF+vl
	xVcc1ZeR23RG0vn21WfvCWfKmpBNShYGhgoLvsynAnshyXysW3dtDio75VtSpi9M/1iiJ3AXB06
	nSUAb4uAdUjlTXaRagKSB/phsD8N3RhSC9xhyxHfyw
X-Gm-Gg: AR+sD11w3kICd7kfRJqSc9MHsdyv67Nbpp+mawyfAri3W1bmSMaXHp3QkgmlOuFmjgC
	mjROg0uY8xoWvpgF02ewAYmlmMqIKJ1x2D6iN8VGbg79IyUPD5zgwyTnTxkCM9KbfUZy4X5kRty
	GxCx8nEnxZiRbMI7+SJ2WqFyb7eh+vqU3tGJLOh/8C+inrbqQt4l5Uqk99tQ==
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id 956f58d0204a3-66885e80a8fmr310941d50.38.1784629416519;
        Tue, 21 Jul 2026 03:23:36 -0700 (PDT)
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id
 956f58d0204a3-66885e80a8fmr310932d50.38.1784629416151; Tue, 21 Jul 2026
 03:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur>
In-Reply-To: <alJpc3nFX9D7_8i1@baldur>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:53:25 +0530
X-Gm-Features: AUfX_my8FmFS_RPsD9P_wAO_xi3w3rSS9J18xqmBVD6VnuXnMyKuUdz39cXSwBQ
Message-ID: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f48aa cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lt5aTsHmsBbDyw7JONsA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: ZDhnEbXx-YBOc3pXViHWHSuDqxADOo4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX1WCFeKGMXRDd
 m9otlOOBGVd5KiRk6wA/qS264gdrA9I8pJ665USTN12ai9u+fVRmIT5/y3qYAXsb49tTGyEw9ix
 AvC7osTxH2wv9DdkuSAkdl6nMgheMhNVeYWbMO1dJNsFIWHT4WBF4eNh6tColZRLlkPYYkzGHBk
 GBlBUYY4osXBdNIBWWDEmXvVdMIhUCH462uvpjnByY+yuVrQKhMKPmWKBAJBcPykAA3LkFso9wj
 u6boETIeviOQeNyNTSg3iBhQkmoyGLouRryMjCs1czTGleHFpbaud0aN9lYNg50M9jlKqkdEtRe
 W6aqSCli/K9sfCIXVwpD0VxOUYzAHKddr8Oe72dmfBk0NYOc6sKG5caxfUeQIqnToJxVA3tTMgV
 B8rZkr7Qts3htEmn4lL/RV7xhjqEXwFba4t1wgX+jhu7LwSH/+g4nt8X869eOMSZW9nhp1SLOE/
 xqc3YhgjTh1dOuRCBaQ==
X-Proofpoint-ORIG-GUID: ZDhnEbXx-YBOc3pXViHWHSuDqxADOo4H
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX8wCt/ld6A592
 pOvKPSu+6Zy2tByny1jzb5o8wUq2ULOhDd9CYhCMo/26llxRWfAGyLaZxhcz+kMz392PIq/4Rsb
 Qj+jkIHMCCIXivaKSxSktMmP21PC0EY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210110

Hi Bryan, Mauro,

On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic P=
AS
> > TZ service allows to support multiple TZ implementation backends like Q=
TEE
> > based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
> > backend service.
> >
>
> Please find an immutable branch with the dependencies for this patch at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702=
115835.167602-2-sumit.garg@kernel.org
>
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

Just a gentle reminder for this patch to be picked up as only the Qcom
media client is left in the next branch for migration to the generic
PAS layer.

If there aren't any conflicts then please allow Bjorn to pick this
patch since the cleanup patch dropping the old SCM APIs is blocked on
this.

-Sumit

>
> Thanks,
> Bjorn
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
