Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699646;
	b=2YAGQxoo9jfp2wNkkXLc0GxroahxF6MpYY1whsa6ywUr+wnl3cDXC6sG5GMxfmnAffJk
	 vM1J0FH6sep0UvFQ21JaxbA+xhuwNmmvKT5jXDIg6o56StWESt5wQXCxloy9ChDfLQ1S3
	 kOODNZ9zXufA43BKQdAbmc7fH1prE4WkMqlJC62YyjagXNtM/Iz3n+DmjCHpJh88fx86r
	 g2XZCLVAWXz2DfNSDyNyJKwhTR+sBdAEyWJFBppUdDgLY/b2AtmNC83cHNF+UDh4EDF7E
	 QqeI9YibX3V7KVY5adyn0tFq+QC6Eafeu5dSaCisnvM5IX82TZx7ZxRhVEgvLZY8zHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
	b=hB8zJGkG1bgzgT8aibj3iKcFbw+SEAczFJxQt/TS9mOfuF60m/lYcQNm/IAwvTWfAAJr
	 DQ9YN6FGd7l9Zzq3yG53QI4YMklCR/wcIradGApQVBrF0RX9avnzIUoPmQ1E/6ByKZ5m/
	 rqlUkf4g74lc8P8NEeOYQ0HbFJBxGxM7k22bxQR4wmbKINA9xmqi4U/hUTc3OTai2fSga
	 OwVr3VZUpcyVWJhCgjAOHVPdjUVFXfLQhat95Jza0oCf2cUBdFq5KX2T9VyANBivHPL8l
	 B1JmAfnXOwuMfyvrsjW2fVT8McRu85j4sg/SQSqjOzC5Qs9ydPYeu3xcHox3XxQ+APA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o/EQdLKf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFA606A33A
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 09:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BFA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o/EQdLKf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hrAWVlej
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38G1ow1433948
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 09:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=; b=o/EQdLKfs59bGx/J
	uKseIGakkcAjOcXXSfxoAZkvuoUyAK7dNIUE/eWrSXijZgbj7t6jFWpfi1PVZqgi
	myUsowxh8Sfos0PEwRvPX9eXjpYADiYximefN88a+aOatON8sAG6Ic+TZV/h0fpG
	/ucIqPtVQh1rsjhBSxo2l9akvayYckPk9twM5bZ+DNR/Mg54R5tWNdme7GtTobnK
	H5WLuvzFeOGybnF9iKFIXZmHXGBIyoSdaWUL4fhkfA60yZsNdyBtDjYxxvxbko4d
	xD6beOuV4PilTHwcla1sgwu+a6xrU6NzEmkOp7cm8nScrl52GwpU/gT+XZGVCt4I
	eVS2sQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjhn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 09:54:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c8a517107so54076496d6.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 01:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699644; cv=none;
        d=google.com; s=arc-20260327;
        b=lR8d2LaDI7nDbTMRa4MNaIrsHm9bJZ3o8b15VB42tnzn4jymTc++TVRO5sE7YcBV6s
         HQI8Jh1oq/GyBcBJepO2wTlkHrkfvikvmZrVBB8PekGsF1sPi12DOFT2nHtwpMHEeozA
         wW9lj5Kutw2wmN5rK/CznjsSPXbLtM5XIX2MiRzdURtXNNm69cROYElLdt3ZdZMoC9oI
         nirEQg8IFJkqVzE5lUGtDFVAh3YBsdb7ab0KH1PA60JN5p2ecUVWP/nIsEt6tTCKvj7M
         Tk+14LG1DcJggBL1H8FFoJYeaSdPt28XIn5DtmsaplBhLQQdYsiA+bo/lOpgD4PywRfZ
         nFLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        fh=NL/ECJYVRsGwkUStlpqbLO6kxF9S7L8TRrh6vWRmlgg=;
        b=Q5DMyc2nVyBdqumN918B6K7YUxtky7OEXD627+swmLljVCMeQv8LpGi/dfYd8K9aEj
         rSPy4rvHLqTG38Jbyftx+hoZzGyfW9UPIfYqMkoqU4pbeP1ddeXc3uia6JwOwXbiLzWm
         3rNT7cQma+GihIXTTEGyzHo9PRr1RJL8N+4p+nvAe9NeaZsZHiH0RJZJFurIK5u/aFtE
         p/n0zS99OZWw3UG4u56eNhMCsUVnd69RQDLty5PlVRqP4x/0q8icgDR/KS6iJQ3EuGqI
         s+twRpKvPNMQJmv06rcJKlWD3JCB3DoTvWfDlpYNNxO9SHVBJ31cSenG76I+b7FOCqCj
         LmiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699644; x=1794304444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=hrAWVlejvqXS1yJdkcfRcXSx7hNArUoeWMNFY0rhGJZbWJbAX0vx4uDrf0Pncwtop7
         jg9nfGdfGyvGrTasB1NdhzHEn1CbwXH01L7QD45fnrhN0kWbtwZRrYC3RjxPHDwNSN8O
         0xjAdsFJHXFfhWkBSVtvurhVcqPQFGVZowxDij1nx4DL8zUUAouw4xRAhKk5uW3Y7BgK
         cvOYZQgo0ywMT2ZpSvkKLChSo+TsiBhyaxpfX5vm1Q1qBNB9vqqBNUOGBx+3mmupSpIa
         vOJOvvM9+AlpRWuNOk/hOgjYyfYDcho1nO5kVT9x1CvB+k9mBnGLHuMyr7zqqiFFHEsD
         w0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699644; x=1794304444;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX610U4zZgvHeWzBdDrzgM12xQ9BuFkZ9gMwlpEqOB8=;
        b=w9pVu56bFAMIEHdNCq5mD6Pdh7gNHjadTCT/JTJmMPUnIJnXk/LGFtV2zDEMgqTMNt
         EWCqS0lRq2q8eOPkHVB1kQyd4bzWQ4K/4QTmViGIT7E9rmKGZ+w76g3BhXjZ65P6iVKH
         5RFPM14B6mWyb70nK82WKdjsFDUj/47UOaMUqfyPMvVrl55UqytNxQ0Aivx+EGUIUMoR
         17k1rRRe+hSiIxlmc+brqU05qL9FlGsoD26JUh0T9TNyGF0VWDxkBuEuorAcZSwmBgFJ
         0Y85hLWYD7XlYCM2rHTHvRZPVqLRZE/FgJJF8OS5Tmdj0ry2qyzUpCeilKHlzpk0J3fA
         rwIA==
X-Forwarded-Encrypted: i=1; AKwUvBzcobRO8NCmLexA+dQg8ym86sCr2oh5+TLERryfhXaNXlUb3i95WVyMk1Qvq08Ba2g8gA914Fgayh+z3A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8qX9zorqA/MGYS2cV3fJyXzD7Dmfa0C9rR+36yLJPBBoxd8ZLI
	AZFSZ+utN81x9vLCXObTroxqYv2voB6lVP32q9rqnVvKSYCvo3WjVB+uestEmG++EhTEGXbf0NY
	6lprIFQlpHLFNzt3UwyMYYHeCYvv4/0osb6kVHQ2wSZFN14/g23GPlGRIhG0dBGNZo7wXtGzepG
	7m7WCfxaGXTTDT3r+pesCphU7DX9QE4JfAeuCnw4XR
X-Gm-Gg: AYBFou2EDaZJeDtU5xweMoWKSib+73jniP1d3/1RHkR8cw8hlPRdi2hlXxFuvr9pUbt
	0r10bpd0Hha6rknHosLW8vfhRVUOrMMQirnsQ2mzJ6anXHK2VWNx9CF1WeFg3JtyXcB9FN+qqKk
	293cTX3vqiLHAXQmbLSAqWPZquPjlaIxuf7cmThAYNreiOgKizLiK0TddyvoMiKwBhXa9PX8CNw
	2keoD4tnph9DGahcdEQdLr5hr5xwLU1v4WYMENexNmgfRtsxTmsmhWlO4QdfTDEgDSypyLHfv4=
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id af79cd13be357-94421737147mr2073343685a.73.1793699644351;
        Tue, 03 Nov 2026 01:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:4153:b0:93e:f9ba:690f with SMTP id
 af79cd13be357-94421737147mr2073341285a.73.1793699643774; Tue, 03 Nov 2026
 01:54:03 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org> <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com> <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
In-Reply-To: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 10:53:52 +0100
X-Gm-Features: AclHuK-p7UhawPaFx7F6Xj5AwKLrYkPyGvAGmkRSwY3CzgDPwBqFDX8qVO1bUZ4
Message-ID: <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence tracking
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9af3d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=GZQqk_n3G85zXuATzoUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+FpLezfDVU9j
 5+oStXW++oNQ5cYsTbIefjL1qr1oSe2L53QOcglEGj5/v+Rk9ZNyPUQLUJp/yJp9/lyQwdyQ0ee
 /j+vpHi9W6QG//FlL9+Cp4KhaWTTsbCdIE23YJiUmPSCMkwQkl+yZIXhojMZP3hO3SO55NzO3bd
 F29eyJc1Z4/cz4At5dRZmvtN38/S2gSoLFJAloWiLo1vBlfWkPFDdppFjcfSc8tWR7ugtKz+nLr
 xjsiG9e2HWk/lQZehUidXx3C4UYM5z+NzzhYKf+h7e02RS3gU+tfn65paT6yPXisocqw2KRpdV5
 JhIhAMkijQDI9z77I4TyrqqzX5R3KsRd8Z6WRBK9ycL0rRiQnCpUuZU0dor6fgHSc2joR7o84Q7
 d3agvzUR2iSZGrS9NZzGu5iS1BKSQF9mbhyPSMdGkUHOQ60fETsIXNfB+kvthtUGhyZ8YaKJ0ap
 tMqpBcXkaY4m8kUWedg==
X-Proofpoint-GUID: JUR2l67MaNyOKpDb3BDS-LWSHLRNJgo5
X-Proofpoint-ORIG-GUID: JUR2l67MaNyOKpDb3BDS-LWSHLRNJgo5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX5WzenHV5uO3u
 2jyi4NfwBzvLFsjuPCFF1NVUAOwmDToDgl5Wh0eFernosTSjCECVecN+L9lq+ty8uPN3enf/CLw
 oFUub51bTQ4xRrxan67NjiK2zMM7XpY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On Tue, Nov 3, 2026 at 10:42=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 11/3/2026 11:33 AM, Loic Poulain wrote:
> > On Tue, Nov 3, 2026 at 8:11=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
> > <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
> >>
> >> Hi Bryan,
> >>
> >> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
> >>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>>
> >>> In order to communicate to user-space CSI2 SOF events we will need to=
 hook
> >>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> >>> implementations of FRAME_SYNC have CSI decoders which support the eve=
nt
> >>> always generate it in our case if and only if an atomic user count
> >>> indicates it should be so.
> >>>
> >>> A flag in the CSID descriptor indicates if frame_sync_en is supported=
 so
> >>> for each SoC that supports it this flag should be true. Since bool is=
 false
> >>> by default no negative enumeration of existing or in-flight CSID is
> >>> required.
> >>>
> >>> Subsequent patches will enable on a per-CSID basis.
> >>>
> >>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >>> ---
> >>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++=
+++++++++-
> >>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
> >>>  2 files changed, 65 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers=
/media/platform/qcom/camss/camss-csid.c
> >>> index a00791b00feb7..e9b399fcb9c7a 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd,=
 int on)
> >>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
> >>>  {
> >>>       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +     unsigned int i;
> >>>       int ret;
> >>>
> >>>       if (enable) {
> >>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd=
, int enable)
> >>>       }
> >>>
> >>>       if (csid->phy.need_vc_update) {
> >>> +             for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> >>> +                     atomic_set(&csid->sof_seq[i], -1);
> >>> +
> >>>               csid->res->hw_ops->configure_stream(csid, enable);
> >>>               csid->phy.need_vc_update =3D false;
> >>>       }
> >>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity=
 *entity,
> >>>       return 0;
> >>>  }
> >>>
> >>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, un=
signed int elems)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_s=
ubdev(sev->fh->vdev));
> >>> +
> >>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
> >>> +}
> >>> +
> >>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =
=3D {
> >>> +     .add =3D csid_frame_sync_add,
> >>> +     .del =3D csid_frame_sync_del,
> >>> +};
> >>> +
> >>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_=
fh *fh,
> >>> +                             struct v4l2_event_subscription *sub)
> >>> +{
> >>> +     struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> >>> +
> >>> +     if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> >>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> >>> +
> >>> +     if (sub->id >=3D MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_=
sync_en)
> >>> +             return -EINVAL;
> >>> +
> >>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> >>> +}
> >>> +
> >>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>> +{
> >>> +     struct v4l2_event event =3D {
> >>> +             .type =3D V4L2_EVENT_FRAME_SYNC,
> >>> +             .id =3D id,
> >>> +             .u.frame_sync.frame_sequence =3D
> >>> +                     atomic_inc_return(&csid->sof_seq[id]),
> >>> +     };
> >>
> >> On first look this was looking strange because the id is used for the
> >> control id events not for frame sync. But on second thought it may mak=
e
> >> sense, but the question is how the userspace should interpret those id=
s?
> >> As of today userspace does not have any info for the VC and csid inter=
nal
> >> pipelines (so called lines). So with the current state of the code
> >> the id is VC which makes sense becouse the SOF/EOF packets are recieve=
d
> >> based on VC. So i am thinking of two options:
> >>
> >> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-devic=
e
> >>    and will be well known to userspace for which line is reported.
> >>
> >> 2. Add and propose extension of videodev2 documentation that
> >>    id of frame_sync event types represents SOF per virtual channel.
> >>
> >> Personally i votoe for (1) because it will well fit with stream-api
> >> support and usespace will have clear understanding of the SOF to which
> >> stream belongs.
> >>
> >> Given this in mind it will be good to open discussion with Laurent, Sa=
kari
> >> regarding SOF event with stream api and GMSL cameras.
> >
> > I think both approaches can be applied independently, forwarding the
> > event through the VFE as event proxy would likely be a straightforward
> > addition.
>
> Yes i agree as well, but the first need broader audience and agreement wh=
at
> should contain this id.
>
> >
> > Note that the id here represents the interface index. While it
> > currently happens to be associated with a VC, that is not necessarily
> > what we want. Ultimately, multiple interfaces can be configured for
> > the same VC.
>
> Yes and that is changed with stream api implementation, and the
> following question: what should be the ID when streams with same VC
> are routed in more lines (hw pipelines).
> But that depends on what this id should represent.

Yes, then maybe option 1 is the way to go for now.
