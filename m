Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7983AE198
	for <linux-media@vger.kernel.org>; Sat,  3 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025876; cv=pass; b=P4HbxLjbVpcUowSpeVFJN0sEg0Q639//rA6OX8HXAZuWxQWdIAsu4SO3sZ0f+qyDjtPGcwwpMY4neT06XISJmGj/olnMzeyCDMkGxAUrmp1aZ/BpU1QgFIbsbBqQSyH6oYTwAZGcMX0a7Q08IeBcBd+7Cw8AxTVFKPSZ9lD/paE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025876; c=relaxed/simple;
	bh=QSTsi0xJf3W1mpjWc0B8G2aXS3mqDz2jPj3tOwKmY1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVu+r9OEgBhdFyIvNcgbExdyTFYRLHeDCyBAOX6foXotuw6EoRN05nvKef2WE1DoTPAX/japS5ueFH+QKXzft3aM0qgAkWupvthmb7YkQThYK6ElVPlQlQBONrm2tTM5nN+uLH5T1XmPEpnBDdnc6+Ay0OtSGHCDuDH/V4nQkIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2oyxHBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez6pS71k; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2oyxHBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez6pS71k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693Au9Lx1054282
	for <linux-media@vger.kernel.org>; Sat, 3 Oct 2026 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=; b=V2oyxHBBB1jvM5Ow
	crcDF4evfefwb0OIznLHLFoXGMh8i8tfuPMFKahTZkdWR7PrsX6H09frhmcdLwLX
	6FyrQaMvTJ0KxitESHH90u60fJA9QnMRhB5gQp18KmMPPriZaT21Dr1MObotAKcT
	VIGDngQ5BrHBgmQVBEZhOFJcFntKAn5nupT2bRkQpF8ax31aW9/FhpAvcjRSDhw4
	tUY7FWyVu19KLcvjcrA/3Pe2Q06+UDZs3sB2wbeXL/mNxxvcDFLw2qynBj35j3mb
	rcYtBdXHH2h6ozG9pubUOJ7ejMv9STp07C2ITM9nR5hztFbge7lMqRaGtUTiQLqz
	Sy2YNw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssgpsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 11:11:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5da613f7588so325667e0c.2
        for <linux-media@vger.kernel.org>; Sat, 03 Oct 2026 04:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025873; cv=none;
        d=google.com; s=arc-20260327;
        b=YzfKvEsPf8JZ0BrrWawRL71NXfksE9PLH966qba+eEAmmKvq+JCGXmSXZC6ih7g7qw
         XeSR8/Je0DgOZzH/zukFFz4fHVQR8nlump3Fr3qSL9t+4cHUfAx5v1sqwVH+F0Qec2dx
         eSMhJbVFYmifKyZvJ+WlGb/iDgSIHlCoDUAXCE56PAQGMiwdMvpXshYG3nCFTv7edjNC
         Nyq31UwEISzcuMrq0huJvdH0oPP9JTvUWN0Dwk2IVqs2v+5fEAoz4zQP5wqaGBOznPT7
         2FbRCP8RwXC+bpW2/RKWtFMtFQt89JQI4wj76OM17Nk7gGEuFgtkkfFRHXEcNe3hpU4S
         AZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        fh=mlXF2LdB03Kt/pmdcGuuAt33zZ6vEGuwP8BKqVW4PoA=;
        b=GUkBYkKkjclfjcfn/q10HJRrvVRN3dUhP1/VzjH+ptHzl83Wj6orWu6Z3NMdpEC0Xi
         bswzeek6LxH9D116S4ELFdWJUgE0zkt3FD4AN/dY6dplF36tHIofwaQ/3LnFjBo7p89u
         ibkWLF5sdi9vuzvmRunIqAYFH/dKlVad98Sx9HGvHQyaj5MEblI5cst2pyFGpjx+uHH8
         ZhCyw2NN2+RGFQsNod7w+guiYoVs0jYURZJAfIH0er+eREfEGvdb+dhSp7Y1ahZfnm20
         EQT3p8uxeePVBtACj18pB8lR4w8aHF8BS2GWaR0Ejq4VfShTrhq6EEw/XxqcG+fwuvZ3
         LvGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025873; x=1791630673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=ez6pS71k7225yfO5SQ5SIyeXqnSI3ya+9mGeI0QVId4tIHRvmUrWmUUGptxbB8smOD
         PeetxH96f6CI0DdvX7sXYqex2hy3dQaHLDYHJVAklrQ8iQyTBbwn+IRtnscs1j9drPWt
         vlMkD/F1ewDkSNmzbiPK7dgEaShnxVIAPjjhozlY0R29IOhOMPiwHntU6nPBYN2KyxWg
         Qp7N/li4CFsT+4ZEPmmkJD+kbQSeF/AKZsSk/JiLX2Vjbl9LyN9bZrc2Nk6OQDNGXtDH
         R5pXF77jFVHCCcWOWH76EVn//N0aKU+8A6AkMvMxmNljjg1LVOwZbPFaM8jtcMXZRw2e
         7t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025873; x=1791630673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=LRjbVb5mowCQGyE0zbZ1gVLvh1KCJgQzRV26PD68FKsPp6AK9+vC+Yn1TnJZ7N55O7
         KOIfSi34/vAGWuar0FaHe4ar8zRHwk45Kj4fk7IhXQJ1Qt8S7wsEB6oukZ/8ebX5OcZ4
         518TdGRLIGJ0u0/gwl5EkgBStQZ5bEHBXUAfNXSEIsY7shzXSTEZpcKfRKDlJTsDqCYx
         So8npncLVntUymxWauF2wQJf6wN2QkZlcOkQEmGmTtjyCAi3HrL8jqUkJ4zu3WU+JIow
         IdgIFKdx42nbNT5MA/+JNpafcuZqIvb9wMXlRyHWriPW7puFAIB7FzbJUt1gOMJ2Mt24
         0ddw==
X-Forwarded-Encrypted: i=1; AKwUvBwkDhqPQrIB+Wgnry30mNVQIs+N1qZcS7wemroo4rxOLV3UZtLxmNwX4qw0LJpADbj8qTdBvXoGmaTI5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJQGGLK41JPOngltKa0tLK8HZPhOLg+t7A2WlGHpxy7w1FBWS+
	uB+m80c09XctO2++yn9pDIAsLL4WLkIpdF01OsVUg9VZ5AkhBUl5PkAQRkF/REIXsMDsK067rtj
	7GOMhD6sISPtlFRfmMZoOx3o4RcedSApfywXjdT2kiwzrhZSCsJ6cz6ZI4jclTWC/ZzlX1NrC5K
	K/BnhI9VIG78vO0kJShBB4vZKy0m7o+EOq9GXEmgIX
X-Gm-Gg: AYBFou1Gx5H7Snx5ALp2gvzlVMIe1etSsPW1u0cMqMFJKN9L3swPsj6T5gGAoXsOxaB
	b8qluJA0wdI4NGAncVP4aj4Ffx27t6CvThPdVMkazc7jXeGlP4nxySRwR2zx8je2RRYbC57/A+W
	hakGq5Ba5GtF6a0J4G4u54FdINQ6HYmnue3U9OriQqQVuIAFEpS+3fTk01qsP9+4cq0yul96dlp
	9BOfQ9xbBp/8HqkQg==
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id 71dfb90a1353d-5dab3357fa0mr1691065e0c.21.1791025872947;
        Sat, 03 Oct 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id
 71dfb90a1353d-5dab3357fa0mr1691051e0c.21.1791025872550; Sat, 03 Oct 2026
 04:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com> <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
In-Reply-To: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:11:01 +0800
X-Gm-Features: AclHuK9kb58p-lhxZ0JM2phaLs-oK0O_r3eZlqRT_1LCVxXx_9IYV-_oLUsV2-s
Message-ID: <CACbMrhrB0k27wBDgADSbhD8Cjyx_-xBvgCOXcwXMxmxxuEhBGA@mail.gmail.com>
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX1hWa8V194f7A
 7v6lIl+fFeVNDDanLx3eZiH0Zovy12kTCU2yvIhlbkKvmbo3kiYLtHUbokuvSQvU9TWmCgRK2GM
 MggBG9Gh1RreCRvGgDwWf5l4TamC6Hk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX1N3hdNfybh8f
 923PaRgQdsjjBjKd0CKU34y9t5/XRhY5nzUfLEHjX4FDo2mvSh8HoJL/QAbTCQInPP6/hik7V6P
 lZM1rh2AwW0mFgKSobi9mFZLO2IOBjFoIROLqvvb8GlHUxQe1k9LUuZeTwHNVT/hVz/Ell6sqGI
 SZ0y489+ML05nnxhjM12X7axdDsFEqsQ6xOXzXof0kiqz/oHWeRZosUrUzsOpQzv/1+NMMbUCUL
 QEBBLaWs9DWUuJmbetz2i7GwxcAuCRbLtabpzQyhFEW1OH/XSbtZ+yer8otvZL4oYH96U8GSQPR
 HX1gbCj6/Ve4ErIoLEfvhglhbuAL0MODwkRkO8uqGHkzcjenk5uGJRkq/uHebbkd8DIpGRv0ZHD
 ffZXVmtvmtJoNWa3g62lO5+tSWWa49RSTLKoatEQ1uLOINDsDjt7kl/3OxLHRns/fsrKRc7401w
 T2oPO3seSjTTFrWEhwQ==
X-Proofpoint-GUID: AT3qjxjGbFKlljMYPLlDfP3ycIpnnFH2
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac0e2d1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=kQtmRZuExVT1y5CfGhAA:9
 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AT3qjxjGbFKlljMYPLlDfP3ycIpnnFH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030044

Ack

Best Regards,
Hangxiang

On Sat, Oct 3, 2026 at 5:09=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/10/2026 10:02, Hangxiang Ma wrote:
> > +                     .hw_ops =3D &csiphy_ops_3ph_1_0,
>
> There's no reason to continue to use the internal CSIPHY hack.
>
> ---
> bod
