Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830005;
	b=gRieynXRgafk7cxh5nHwWGzCIALXLRxJCHyPzF7q3JmzxKKQpwcYb9U7Gh4iuq9zMdXa
	 v/uSets2vb45mQyrPzjEJqt4TCXle2C8fCIqLgB6qpslQfhC90HWVDB1QSWygEP4a/8n2
	 YRYprV6bKJB2oQ9OzaQ3DuMlVqUWoz2SFfErdGlArsKc3CLHEKkC8clYMTJ6V0biauIiE
	 Gizh38YF46Y2fg8OGeN7iyXcKnwl0/8T+i/7oiatB2Fp254YMufcUE+K5OcklNgy6gRzT
	 eot8T5sC6eM1SIviyQOoZ7Ks54kewWIOOrcTw1cvvYvzggjcGqlo6/NFQ/VCGAXfY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
	b=1Z48XVKpZl1lA2NW3O9UuiBbPR1vm/VVkvLSsEXLd9gw80lq8Fl7bbBoHEPtbWZD/qeA
	 sJJfEXmAR6jbnzkUjpe8nAJa7tPB0gjMJRgq5PKmKBh/54/YtgCTQ9NwnqPyTs32wgX/l
	 Uh55BWHJ41XJ3nRF0EgGzWUEuxSfdQHT2O4VjfBjb8H7DPUrrDpWx/1oebn/5I+h/AyN+
	 vDJ8DjuOR+vatd1ay/TgW3VLDWD5IWpMeyQ5IKyo2ytiVUU2+0VlkGEZvoYJrx+ODnSwh
	 O1/NjdSFPpGKcZx5gISHaxiRI5apZhsm4NCjuUdI2Lmq9Fb41RyY8tIZiXJyQBLg6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EA2606A31D
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74EA2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GhTyjEHD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=egJTqpDV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O4dsAB3321828
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=G27Cz2wceBx
	SG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=; b=GhTyjEHDE07M9G/UnEBw/TGNWJg
	BJGF76rSgOLqxvmOwTzddatBU6wrde/banDq+aEdI5UiAv2hkmxpf3ZOwcBp5JwN
	SpzH50PMrnZV1+LFn1pJ4wFyjJ2swVYcbNpUq8q36Yd1E1OxTlQaRnz1P/5eiZUX
	QI0Ts8R3TIrFk76dlRJTpqKPPJ3ukI4mG/JfXD/OBl7IIq37zY+oPH8ILD2firC/
	WvezK1PPTg9LOIMODAbKkLnZ3g8G42HeXZ2gfrUB+o0gJDqtYrx2hS2C21FNNtpb
	5bHG0DyyblXEaYq0wqT1SmGEK4FB0LVjyAtaQfnkoNgB+ypRKc/CGs+5sKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8ckq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e49a1d3b1so7489885a.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830002; x=1793434802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=egJTqpDVDM8ojBT5Oz/kKJutar0kT8QEAxY7VnmBik3EVH2cEng64r6xhS041siq3X
         CMLH0vn816MOLw4ux3B8sFp2KvnoUU+nFbV5IOtmFTpNSXadd5Fh1oxz88kumHc88ELP
         D7/uPXcMQM4w/oIY8QlcKp7jLzYPL06NxJi9FUw3Nm8g73+s6Z6vZ+SK2Qmb0Huk/YNV
         9G1mjnsuutgXfK/yPqUWhHku8EkPwRqdouE+EKou8IVm/M3Q6qMdJ6JhUTU4x35OSQcN
         BBJH4VFukcvR63Xy4vkXyewYnVLq1Poe3H6AWXAjNHZfFfEekVn06JCKgCanc/1Gr7ph
         9aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830002; x=1793434802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G27Cz2wceBxSG1zNS8aH7ZlX39WGpLP7K7D6Ef2Z9YE=;
        b=iF/oJHRNz+fbTAKxOHSUQELkkCjBVA5Hmnce1xAdINpjcPb5P3kZmYmS5FgPoPtOAL
         +XXQLnpnN8M26okAiAq4PbZXmy4XSxfNsoksfRxQ/SuWYk7oGGKTNQpbWrn4iIqRZNjX
         HuoGAsgdQ/uWshAgX5QZqqCo4qa8N9l4INL6Jpwc+wWpqsUv4bG5ceCwaVYmQWg6Kvpb
         LGD2lswh1dBoAGzhYXOoEe6ekSiBmEflulSp08PsTj3Bp3QHVRnIVkodR5MhkOYT7/id
         g7gCYrTMglgD/XHivSAY0AICu/RxgcOiawUJOHgh668BsAXI8QIA0yStodDLcgGYpBhz
         qfaw==
X-Forwarded-Encrypted: i=1; AKwUvBwLCDMm7Jh1mTCqHBHdVrKEAtQI48HpO+DTUO8IaKUvZIzNvmNbdBp3iMgeu3SPu3YmWop/BEwRTMnCgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIxuV4zk+Q3lUqtYNhG5m94C5En5L2X2f1ITSzSn6z78HyXURgB
	zqLNL3rJRzg4cEVR8LVWovK/y2Lu5v3wjCErXa9Pa4wxOBi2n6Z7iazmHZMfxXB/KPwTWwi9SDK
	4f7cbUeYglwEM+6LDetsy/7LoZTqjKLqGggJvG8Lbu4/V5zXzu5ViEBYW5pqT3/2T8Q==
X-Gm-Gg: AYBFou00V8c4TSRzZ6EF/IYDBKdFCb3Hg8JzjwyPH2mJAhRV9CZkyTUP21geYXmHOw8
	cwN40qhDBTU7BUo3EVVmnVw7tlpujXLeslok8QMRWqTGHsg9fEvEfdZ7tXoi8egig671igpz9Ll
	Bu1LncD9Y3btxom0QHilMFaWBkh5IHklrPrLuve6ThW8s4uYqdXSmPzR6hEDxpQRLukbqfjyd1C
	TNigt0Y4oGa4b4auUB33QQb3dIBm7acLBg8Z5LD9FPgGHpjaNolmKIJrKq4hrz82gQ/1izmyiSd
	0nq7Y7qIrT/d03jEH5H0NFTnyV8HFKC0uwA+9Z7UVyrRUtMGo1mdPURlWl+9MPoUcahVh6lAHdG
	b5bw7CEsEyNpHVFWXEF0a/Alz
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32783485a.69.1792830002502;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
X-Received: by 2002:a05:620a:a881:10b0:940:f53d:5f7 with SMTP id af79cd13be357-940f53d1553mr32782485a.69.1792830002062;
        Sat, 24 Oct 2026 01:20:02 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:01 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
Date: Sat, 24 Oct 2026 11:19:57 +0300
Message-Id: <20261024081959.2887288-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
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
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc6a33 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dDcOnGmwcWcmha_HxNsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: MxS3_bZk_Rth4kg_vt8kl8mJl4D6eGfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXzzBfK8lK0QaQ
 XIz0e72LQ90wAVuFolp/jFbg2vZbYEHY1Xlamv165eiL1f6rewDpCrLOEqFdOibZca7//1cwhTF
 b19Nw13syskENkt0yfc5sa/0lv5wOKj6s3lUBZSD2RYQPYmXKzGbRpEUkSLv3+zudX8GqsYz50g
 taaazX19yDKjg2/oty5f9D1a/7OhyoOxCOOXYqs8vL2ClehUXW64fH9cZQb4yOzBrIz+gyYKpLx
 xeq92b20/Tzrna3jmZ10JrgJWhJWtR375KQGab3QyZXesdblpqMkChya4M1SXjG4t389XQ9sRZ5
 cpEGo9d7RpnwzP0HT1nPtoORepvucJNBB1mkg1Mg7QtTDTwLJzPzc9b+CsW+5yQOirXUroyCpbO
 Axp4lT6KlsfNNz+Du27icT0YqEHrmtD+qB8eCLHK4yQ8jVxRyyTwn/NaVkfEKX5OKYsiLC9LLmD
 iUzK4cXcSEQ3+UPR7bg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXyhGiuJmTkZI/
 sTPcdQm+5Ahd/oq4r+24ai7wY3eNMyt8z2bjZZWOPiZKfE5VAVMshdWPsiifN2cGl8LkQ1rw25K
 kRal5HnZfZCnkHhq3qI3lcNYNweXGck=
X-Proofpoint-GUID: MxS3_bZk_Rth4kg_vt8kl8mJl4D6eGfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:44, Bryan O'Donoghue wrote:
> On 23/10/2026 16:28, Atanas Filipov wrote:
>> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
>> use the same shared clock sources are not covered and are left to a
>> separate change.
>
> Lets discuss that change so. We need to represent shared clocks through
> CamNoC anyway right ?

Yes. The camera NoC AXI clock is shared by everything that writes
through the camera NoC: the CAMSS front ends, and offline engines such
as OPE and JPEG that are separate devices. Today no one aggregates
their requests.

I have posted two versions of this so far:

  - v2 added a CAMNOC interconnect provider with one port per client:
    https://lore.kernel.org/all/20260819093211.1436275-1-atanas.filipov@oss.qualcomm.com/
  - v3 exports the camcc camera NoC AXI RCG through icc-clk, as
    gcc-ipq9574 does:
    https://lore.kernel.org/all/20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com/

On v3 Krzysztof objected that a clock is not an interconnect and
suggested fixing the clock framework instead. Dmitry asked to land
icc-clk first, then the optional CAMSS interconnect, then JPEG. Both
questions are still open. Gjorgji summarised the two options in this
thread.

This series does not depend on that choice. It only stops the VFEs
from overriding each other inside CAMSS. Once the camera NoC is
represented, the VFE stops setting the camera NoC AXI rate and votes
instead; I have that change ready on top of v3.

Which direction do you prefer: per-client ports in a CAMNOC provider
(v2), icc-clk on the camcc RCG (v3), or the clock framework?

Regards,
Atanas
